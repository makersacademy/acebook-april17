class PostsController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    @post = Post.create(post_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(session[:current_user_id])
    @posts = Post.where(user_id: @user.id)
  end

  private

  def post_params
    { user_id: params[:user_id], message: params[:message] }
  end

end
