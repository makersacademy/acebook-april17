class PostsController < ApplicationController

  attr_reader :user_name
  
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @user_name = session[:user_name]
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    redirect_to posts_path
  end

  def user? 
    @user_name != nil
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
