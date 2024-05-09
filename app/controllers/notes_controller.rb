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

  def create
    note = Note.create(note_params)
    if note.valid?
      render json: note
    else
      render json: note.errors, status: 422
    end
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    if note.valid?
      render json: note
    else
      render json: note.errors, status: 422
    end
  end

  def destroy
    note = Note.find(params[:id])
    if note.destroy
      render json: {}, status: 204
    else
      render json: {}, status: 422
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :creator, :public)
  end
end
