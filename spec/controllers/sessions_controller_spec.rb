require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: {session: {name: 'Caitlin', email: 'test@mail.com', password: 'text1234', password_confirmation: 'test1234'}}
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http failure" do
      delete :destroy
      expect(response).to have_http_status(302)
    end
  end

end
