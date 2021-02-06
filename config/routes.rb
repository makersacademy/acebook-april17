Rails.application.routes.draw do


  get 'friends', to: 'friendships#index'
  resources :friendships do
    get '/status', to: 'friendships#status', on: :member
    member do
      patch :accept
      put :accept
      delete :decline
    end
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'posts#index'
  get '/posts', to: 'posts#index'
  #get '/friends',to: 'users#show', as: 'friends'
  end
