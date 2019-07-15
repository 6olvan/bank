module LoggedUser
	def getLoggedUser
		unless session[:logged_user_id]
			redirect_to login_path
			return
		end
		@logged_user = User.find_by(id: session[:logged_user_id])

		unless @logged_user
		 	redirect_to login_path
		end 
	end
end