require 'rails_helper'
require 'test_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it 'handles an invalid signup' do
      get '/users/new'
      post '/users', params: { user: {
        name: "",
        email: "invalid@email",
        password: "weaker",
        password_confirmation: "weakest"
      }
      }
      expect(response).to render_template(:new)
    end
  end

end
