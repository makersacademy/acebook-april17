Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "session/create"
  resources :posts, :session, :users


  get '/' => 'users#new'


end
