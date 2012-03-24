class ApplicationController < ActionController::Base
  protect_from_forgery

	def signed_in?
		!current_user.nil?
	end

	def signed_in_user
		redirect_to root_url unless signed_in?
	end

	private
		
		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end

		helper_method :current_user
end
