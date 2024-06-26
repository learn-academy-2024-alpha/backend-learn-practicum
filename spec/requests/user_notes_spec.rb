require "rails_helper"

RSpec.describe "UserNotes", type: :request do
  describe "POST #create" do
    it "creates a user_note relationship and returns with a http success" do
      user = User.create!(username: "testuser", email: "user@example.com", password: "testpassword", password_confirmation: "testpassword")
      note = Note.create!(title: "some example title", content: "Sample note content", creator: 1, public: true)

      post user_notes_path, params: {
        user_note: {
          user_id: "testuser",
          note_id: note.id
        }
      }

      user_note = UserNote.find_by(user_id: user.id, note_id: note.id)

      expect(response).to have_http_status(200)
      expect(user_note).to be_valid
    end
  end

  describe "DELETE #destroy" do
    it "deletes a user_note relationship and returns with a http success" do
      user = User.create!(username: "testuser", email: "user@example.com", password: "testpassword", password_confirmation: "testpassword")

      note = Note.create!(title: "some example title", content: "Sample note content", creator: 1, public: true)

      user_note = UserNote.create(user_id: user.id, note_id: note.id)

      delete user_note_path(user_note)
      user_note = UserNote.where(user_id: user.id).first
      expect(user_note).to eq(nil)
    end
  end
end
