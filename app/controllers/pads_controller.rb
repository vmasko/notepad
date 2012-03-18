class PadsController < ApplicationController
  def index
		@pads = current_user.pads
  end

  def show
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
