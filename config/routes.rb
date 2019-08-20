# frozen_string_literal: true

Rails.application.routes.draw do
  get 'walls/index'

  get 'walls/show'

  get 'walls/create'

  get 'walls/new'

  get 'walls/edit'

  get 'walls/update'

  get 'walls/destroy'

  get 'sessions/new'
  get 'sessions/new'

  resources :users
  resources :walls

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/users', to: redirect('/')



  resources :posts

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
