Rails.application.routes.draw do
  get 'sessions/index'

  get 'sessions/show'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :users
end
