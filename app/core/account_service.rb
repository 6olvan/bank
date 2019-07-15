class AccountService
	TYPE_TOP_UP = 0
  TYPE_WRITE_OFF = 1

	def create(user)
		Account.create(user_id: user.id, balance: 0)
	end

	# return [Integer] total balance
	def operation(account, params)

		prepared_params = prepare_params(params)
		validate_operation prepared_params

		amount = prepared_params[:amount]
		amount = amount * -1 if prepared_params[:type] == TYPE_WRITE_OFF
		
		t = account.transactions.build
		t.type_id = prepared_params[:type]
		t.amount = prepared_params[:amount]
		t.desc = prepared_params[:desc]

		unless t.save
			ErrorBag.addErrors(t.errors.full_messages)
			raise ErrorBag::ValidationException
		end
    
		account.balance += amount

		unless account.save
			ErrorBag.addErrors(account.errors.full_messages)
			raise ErrorBag::ValidationException
		end

		NotificationMailer.transaction_success(t).deliver_later
		account.balance
	end

	private
		def prepare_params params
			params[:type] = params[:type].to_i
			params[:amount] = params[:amount].to_i
			params
		end

		def validate_operation params
			if params[:amount] <= 0
				ErrorBag.addError "Amount should be positive"
				raise ErrorBag::ValidationException
			end
		end
end
