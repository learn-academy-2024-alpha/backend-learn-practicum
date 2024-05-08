class NotesController < ApplicationController
  def index
    note = Note.where(public: true)
    render json: note
  end

  def show
    user = User.find(params[:id])
    private_note = user.notes.where(public: false)
    render json: private_note
  end
end
