Rails.application.routes.draw do
  get 'profile/index'
  root "welcome#index"

  resources :users do
    resources :albums
    post '/users/:user_id/albums', to: 'albums#create', as: 'create_album'
  end

  resources :sessions, only: [:new, :create, :destroy]
  # resources :albums

  get 'sessions/new'
  get "sessions/create"
  get 'sessions/destroy'
  get 'signup', to: "users#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'

  resources :posts do
    resources :comments
    delete '/comments/:id', to: 'comments#destroy', as: 'destroy_comment'
    patch '/comments/:id', to: 'comments#update', as: 'update_comment'
  end

  post '/users/:user_id/images/:id', to: 'profile#set_photo', as: 'set_profile_photo'
  delete '/users/:user_id/albums/:album_id/images/:id', to: 'images#destroy', as: 'destroy_image'
  delete '/users/:user_id/albums/:id', to: 'albums#destroy', as: 'destroy_album'
  delete '/posts/:id', to: 'posts#destroy', as: 'destroy_post'
end