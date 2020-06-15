require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "GET /login" do
    it 'displays a flash with invalid signin' do
      get '/login'
      post '/login', params: { session: {
        email: "invalid@email",
        password: "weak"
        }
      }
      expect(flash.empty?).to be(false)
      get '/login'
      expect(flash.empty?).to be(true)
    end
    it 'flash error does not persist' do
      get '/login'
      post '/login', params: { session: {
        email: "invalid@email",
        password: "weak"
        }
      }
      get '/login'
      expect(flash.empty?).to be(true)
    end
  end
end
