# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  get 'users/registration_confirmation'
  get 'users/show'

  root to: 'application#redirect_to_login'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'posts/:id/edit', to: 'posts#edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :comments
  end 
end
