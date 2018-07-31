require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  describe "Get /session/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /session" do
    it "responds with 200" do
      session :create, params: { session: { email: "jay@gmail.com", password: "jay123" } }
      expect(response).to redirect_to(user_url)
    end

    it "create a session" do
      session :create, params: { session: { email: "jay@gmail.com", password: "jay123" } }
      expect(Session.find_by(id: 1)).to be
    end
  end
end
