class UserNotesController < ApplicationController
  def create
    username = params[:user_note][:user_id]
    user = User.where(username: username).first
    params[:user_note][:user_id] = user.id
    user_note = UserNote.create(user_note_params)
    if user_note.valid?
      render json: user_note
    else
      render json: user_note.errors, status: 422
    end
  end

  def destroy
    user_note = UserNote.find(params[:id])
    if user_note.destroy
      render json: {message: "User note destroyed"}
    else
      render json: {error: "User note not found"}, status: 422
    end
  end
end

private

def user_note_params
  params.require(:user_note).permit(:note_id, :user_id)
end
