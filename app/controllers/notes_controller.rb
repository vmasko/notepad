class NotesController < ApplicationController

	before_filter :signed_in_user
	before_filter :correct_user, :only => [:show, :edit, :destroy]

  def index
		@pad_id = params[:pad_id]
  end

  def show
		begin
			@pad = Pad.find(params[:pad_id])
			@note = Note.find(params[:id])
  	rescue ActiveRecord::RecordNotFound
			flash[:alert] = "Couldn't find Note with id=#{params[:id]}."
			redirect_to @pad
		end
	end

  def new
		@note = Pad.find(params[:pad_id]).notes.new
  end

  def create
		@pad = Pad.find(params[:pad_id])
		@note = @pad.notes.build(params[:note])
		@note.title = "#{@note.content[0..25]}..." if @note.title == ""
		if @note.save
			redirect_to @pad
		else
			render 'new'
		end
  end

	def update
		@pad = Pad.find(params[:pad_id])
		@note = Note.find(params[:id])

		if @note.update_attributes(params[:note])
			flash[:notice] = "Updated!"
			redirect_to @pad
		else
			render 'show'
		end
	end

  def destroy
		Note.find(params[:id]).destroy
		redirect_to Pad.find(params[:pad_id])
  end


	private
		
		def correct_user
			@note = current_user.notes.find_by_id(params[:id])
			redirect_to root_url if @note.nil?
		end	
end
