class AuthService
	def register(params)
		user = User.create(params)
		
		if user.invalid?
			ErrorBag.addErrors(user.errors.full_messages)
			raise ErrorBag::ValidationException
		end
		user
	end

	def login(name, password)
		user = User.find_by(name: name)

		unless user&.authenticate(password)
				ErrorBag.addError('name or password incorrect')
				raise ErrorBag::ValidationException
		end
		user
	end

end
