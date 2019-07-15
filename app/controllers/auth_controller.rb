class AuthController < ApplicationController
  def login
  	login_params = allowed_params
  	@url = login_path

  	suppress(ErrorBag::ValidationException) do
  		if request.post? and login_params.permitted?
	  		user = @auth_service.login(
	  			login_params[:name],
	  			login_params[:password]
	  		)		

	  		session[:logged_user_id] = user.id
  			redirect_to accounts_path
  		end
  	end
  end

  def register
  	reg_params = allowed_params
  	@url = register_path
  	
  	if request.post? and reg_params.permitted?
  		suppress(ErrorBag::ValidationException) do
  			user = @auth_service.register(reg_params)
        account_service = AccountService.new
        account_service.create(user)
        redirect_to login_path
  		end
  	end
  end

  def logout
  	session[:logged_user_id] = nil
  	redirect_to login_path
  end

  private
  	def allowed_params
  		params.permit(:name, :password)
  	end
end
