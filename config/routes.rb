Rails.application.routes.draw do
  get "/", to: "users#index"

  get 'users/login'
  post '/users/authenticate'
  get "/users/log_out"

  get "/timeline", to: "posts#index"

  resources :posts, :users
end
