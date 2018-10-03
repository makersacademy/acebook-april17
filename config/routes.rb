Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      devise_for :users
      get 'home/index'

      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      resources :posts
      resources :users
      # resources :posts

      root 'home#index'
    end
  end
end
