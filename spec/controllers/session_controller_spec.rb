# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'redirects to root' do
      post :create, params: { session: { email: @user.email, password: @user.password } }
      expect(response).to redirect_to(posts_url)
      expect(signed_in?).to be true
    end

    it 'starts a session' do
      post :create, params: { session: { email: @user.email, password: @user.password } }
      expect(signed_in?).to be true
      expect(current_user).to eq(@user)
    end

  end 

  describe 'DELETE /' do
    it 'redirects to root' do
      delete :destroy
      expect(response).to redirect_to(:root)
    end

    it 'ends the session' do
      delete :destroy
      expect(signed_in?).to be false
      expect(current_user).to be nil
    end
  end

end 

