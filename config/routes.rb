Rails.application.routes.draw do

  resources :avatars
  resources :profiles do
    resources :bios, :friends
    resources :posts do
      resources :comments, :likes
    end
  end

  devise_for :users

  devise_scope :user do
     # root to: "devise/sessions#new"
     get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to:'posts#homepage'


  match "/profiles/posts", to: "posts#create", via: "post", :as => :create_post
  match "/profiles/bios", to: "bios#create", via: "post", :as => :create_bio
  match "/profiles/:profile_id/posts/:id/comments", to: "comments#create", via: "post", :as => :create_comment

end
