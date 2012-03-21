class PadsController < ApplicationController
  def index
		if current_user
			@pads = current_user.pads
		end  
	end

  def show
		@pad = Pad.find(params[:id])
		@notes = @pad.notes
  end

  def new
		@pad = Pad.new
  end

  def create
		@pad = current_user.pads.create(params[:pad])
		redirect_to root_url
  end

  def destroy
		Pad.find(params[:id]).destroy
		redirect_to root_url
  end
end
