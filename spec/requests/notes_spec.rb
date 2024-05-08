require "rails_helper"

RSpec.describe "Notes", type: :request do
  describe "GET /index" do
    it "returns a list of public notes and  a successful http response" do
      note = Note.create(title: "Note 1", content: "Content 1", public: true)
      get notes_path
      expect(response).to have_http_status(200)
      expect(note).to be_valid
    end
  end

  describe "GET /show" do
    it "returns a list of private notes and a successful http response" do
      user = User.create(email: "test@email.com", password: "password", password_confirmation: "password", username: "test")
      note = Note.create(title: "Note 1", content: "Content 1", public: false)
      get note_path(id: user.id)
      expect(response).to have_http_status(200)
      expect(note).to be_valid
    end
  end
end
