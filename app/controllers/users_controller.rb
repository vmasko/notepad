class UsersController < ApplicationController
  def new
		@user = User.new
  end

  def create
		@user = User.create(params[:user])
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "User was successfully created!"
			UserMailer.welcome_mail(@user).deliver
			redirect_to root_path
		else
			render "new"
		end
  end

  def destroy
  end
end
