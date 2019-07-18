Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  root 'users#new'
  resources :posts
  resources :users
  resources :sessions, only: [:new, :create]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
