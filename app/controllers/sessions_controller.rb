class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     flash[:success] = "Welcome to Acebook by D-Railed!"
     (redirect_to posts_path) && (return)

   else
     flash.now.alert = 'Email or password is invalid.'
   end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end


end
