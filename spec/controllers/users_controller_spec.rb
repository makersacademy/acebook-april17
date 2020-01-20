require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { build(:user) }

  before(:each) do
    sign_in user
  end

  describe "GET /users/:id" do
    it "responds with 200" do
      get :show
      expect(response).to have_http_status(200)
    end
  end

end
