Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user#new'
  
  resources :posts do
    resources :comments
  end
  resources :users
  resources :sessions

  get 'signup' => 'user#new'  
  post 'signup' => 'user#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get '/wall/:name' => 'wall#show'
  get 'posts' => 'posts#index'
  patch 'posts' => 'posts#edit'
  delete 'posts' => 'posts#delete'
end
