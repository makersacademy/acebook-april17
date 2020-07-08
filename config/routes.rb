Rails.application.routes.draw do
  get 'rooms/show'
  mount ActionCable.server => '/cable'
  
  resources :messages, only: [:new, :create]
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
             controller: "clearance/passwords",
             only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/users" => 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/wall/:id' => "wall#new"
  resources :posts
  resources :wall
  root to: 'sessions#new'
end
