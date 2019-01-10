Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'
  match 'friends/search' => 'friends#search', via: :get, as: 'friends_search'
  match 'friends/create' => 'friends#create', via: :post, as: 'friends_create'
  resources :posts
  match 'users/:id' => 'users#show', via: :get, as: 'profile_page'
  resources :comments, :except => [:new]
  get 'posts/:id/comments/new' => 'comments#new'
  match 'users/:id' => 'users#remove', via: :delete, as: 'delete-user'
end
