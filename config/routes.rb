Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    root to: "devise/registrations#new"
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
  end

  get "users/:id" => "users#show"

  resources :posts

  resources :posts do
    resources :likes
  end
end
