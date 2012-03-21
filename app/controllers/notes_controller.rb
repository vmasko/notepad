class NotesController < ApplicationController
  def index
		@pad_id = params[:pad_id]
  end

  def show
  end

  def new
		@note = Pad.find(params[:pad_id]).notes.new
  end

  def create
		@note = Pad.find(params[:pad_id]).notes.create(params[:note])
		redirect_to Pad.find(params[:pad_id])
  end

  def destroy
		Note.find(params[:id]).destroy
		redirect_to Pad.find(params[:pad_id])
  end
end
