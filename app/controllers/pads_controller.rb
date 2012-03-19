class PadsController < ApplicationController
  def index
		if current_user
			@pads = current_user.pads
		end  
	end

  def show
		@pad = Pad.find(params[:id])
		if current_user == @pad.user
			session[:pad] = @pad
			@notes = @pad.notes
		else
			redirect_to root_path
		end
  end

  def new
		@pad = Pad.new
  end

  def create
		@pad = current_user.pads.create(params[:pad])
		redirect_to root_url
  end

  def destroy
  end
end