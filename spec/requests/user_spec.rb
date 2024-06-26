require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    it "returns http success" do
      user = User.create(email: "test@email.com", password: "password", password_confirmation: "password", username: "test")
      get "/user/#{user.id}"
      expect(response).to have_http_status(:success)
      expect(user.email).to eq("test@email.com")
      expect(user.username).to eq("test")
    end
  end
end
