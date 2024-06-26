require "rails_helper"

RSpec.describe "Notes", type: :request do
  describe "GET /index" do
    it "returns a list of public notes and  a successful http response" do
      note = Note.create(title: "Note 1", content: "Content 1", creator: 1, public: true)
      get notes_path
      expect(response).to have_http_status(200)
      expect(note).to be_valid
    end
  end

  describe "GET /show" do
    it "returns a list of private notes and a successful http response" do
      user = User.create(email: "test@email.com", password: "password", password_confirmation: "password", username: "test")
      note = Note.create(title: "Note 1", content: "Content 1", creator: 1, public: false)
      get note_path(id: user.id)
      expect(response).to have_http_status(200)
      expect(note).to be_valid
    end
  end

  describe "POST #create" do
    it "creates a valid note and a successful http response" do
      post notes_path, params: {
        note: {
          title: "test",
          content: "this is test content",
          creator: 1,
          public: true
        }
      }
      note = Note.where(title: "test").first
      expect(response).to have_http_status(200)
      expect(note).to be_valid
    end
    it "creates an invalid note" do
      post notes_path, params: {
        note: {
          title: nil,
          content: nil,
          creator: nil,
          public: nil
        }
      }
      note = Note.where(title: nil).first
      expect(response).to have_http_status(422)
      expect(note).to eq(nil)
    end
  end

  describe "PATCH #update" do
    it "updates a valid note with http success" do
      post notes_path, params: {
        note: {
          title: "new test",
          content: "this is a new test content",
          creator: 1,
          public: true
        }
      }
      note = Note.where(title: "new test").first
      patch note_path(note), params: {
        note: {
          title: "updated test",
          content: "updated this is test content",
          creator: 1,
          public: false
        }
      }
      note = Note.where(title: "updated test").first
      expect(note.title).to eq("updated test")
      expect(note.content).to eq("updated this is test content")
      expect(note.public).to eq(false)
      expect(response).to have_http_status(200)
    end
    it "makes an invalid update to an existing note" do
      post notes_path, params: {
        note: {
          title: "invalid update test",
          content: "invalid update content",
          creator: 1,
          public: false
        }
      }
      note = Note.where(title: "invalid update test").first
      patch note_path(note), params: {
        note: {
          title: nil,
          content: nil,
          creator: nil,
          public: nil
        }
      }
      note = Note.where(content: nil).first
      expect(response).to have_http_status(422)
      expect(note).to eq(nil)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a note" do
      note = Note.create(
        title: "delete test",
        content: "delete this is test content",
        creator: 1,
        public: false
      )
      expect {
        delete note_path(note)
      }.to change(Note, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end

  describe "422 error" do
    it "creates an invalid note" do
      post notes_path, params: {
        note: {
          title: nil,
          content: nil,
          creator: nil,
          public: nil
        }
      }
      note = Note.where(title: nil).first
      expect(response).to have_http_status(422)
      expect(note).to eq(nil)
    end
  end
end
