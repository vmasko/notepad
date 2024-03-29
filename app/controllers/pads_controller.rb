class PadsController < ApplicationController

	before_filter :signed_in_user, :only => [:show, :new, :create, :destroy]
	before_filter :correct_user, :only => [:show, :destroy]

  def index
		if current_user
			@pads = current_user.pads
		end	
	end

  def show
		begin
			@pad = Pad.find(params[:id])
			@notes = @pad.notes.paginate(:page => params[:page], :per_page => 5)
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Couldn't find Pad with id=#{params[:id]}."
			redirect_to root_url
		end
  end

  def new
		@pad = Pad.new
  end

  def create
		@pad = current_user.pads.build(params[:pad])
		if @pad.save
			redirect_to root_url
		else
			render 'new'
		end
  end

  def destroy
		Pad.find(params[:id]).destroy
		redirect_to root_url
  end

	private
		
		def correct_user
			@pad = current_user.pads.find_by_id(params[:id])
			redirect_to root_url if @pad.nil?
		end	
end
