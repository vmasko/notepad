class NotesController < ApplicationController
  def index
		@pad_id = params[:pad_id]
  end

  def show
		@pad = Pad.find(params[:pad_id])
		@note = Note.find(params[:id])
  end

  def new
		@note = Pad.find(params[:pad_id]).notes.new
  end

  def create
		@note = Pad.find(params[:pad_id]).notes.create(params[:note])
		redirect_to Pad.find(params[:pad_id])
  end

	def update
		Note.find(params[:id]).update_attributes(params[:note])
		flash[:notice] = "Updated!"
		redirect_to Pad.find(params[:pad_id])
	end

  def destroy
		Note.find(params[:id]).destroy
		redirect_to Pad.find(params[:pad_id])
  end
end
