require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "Session #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Session #create' do
    context 'When a user successfully logs in ' do
      before(:each) do
        @user = User.create(name: 'Ben', 
        email: 'ben@example.com', 
        password: "123456",
        password_confirmation: "123456")
        post :create, params: { user: { email: "ben@example.com", password: "123456" } }
      end

      it "sets the session to the user's id" do
        expect(session[:user_id]).to eq @user.id
      end

      it "redirects to the user's posts/wall page" do
        expect(response).to redirect_to '/posts'
      end
    end
  end

  describe "Session #destroy" do
    context "when a user clicks the logout button" do
      before(:each) do
        get :destroy
      end

      it 'clears the session' do
        expect(session[:user_id]).to be nil
      end
      
      it 'redirects to the login page' do
        expect(response).to redirect_to '/login'
      end

      it "displays a flash notice, informing the user that they've been logged out" do
        expect(flash[:notice]).to match 'Logged out'
      end
    end
  end
end
