require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /" do
    it "responds with 200" do
      sign_in
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
