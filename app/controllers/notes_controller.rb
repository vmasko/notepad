class NotesController < ApplicationController
  def index
		@pad_id = params[:pad_id]
  end

  def show
  end

  def new
		@note = Note.new
  end

  def create
		@note = Pad.find(session[:pad].id).notes.create(params[:note])
		redirect_to session[:pad]
  end

  def destroy
		Note.find(params[:id]).destroy
		redirect_to Pad.find(params[:pad_id])
  end
end