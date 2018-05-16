Rails.application.routes.draw do

  match 'like', to: 'likes#like', via: :post
  match 'unlike', to: 'likes#unlike', via: :delete
  resources :likes
  devise_for :users, controllers: { registrations: "users/registrations"}
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts


end
