Rails.application.routes.draw do
  get 'startup/index'

  devise_for :users
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts do
    resources :comments
  end
  
  resources :users, only: [:show, :index]

  put 'update/posts'

end
