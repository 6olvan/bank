class ApplicationController < ActionController::Base
	include LoggedUser

	rescue_from Exception, with: :on_exception
	before_action :getLoggedUser, except: [:login, :register]

	def initialize
		super
		@auth_service = AuthService.new
		ErrorBag.clear
	end

  def on_exception(exception)
    NotificationMailer.error(exception.message, exception.backtrace).deliver_later
  end
end
