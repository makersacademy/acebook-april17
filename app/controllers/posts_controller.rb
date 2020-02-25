# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :current_post, only: %i[show edit update destroy]
  def new
    @post = Post.new

  end

  def create
    @user = User.find(session[:user_id])
    # @target_user
    p "HERERERERERERERERERRERERRERE"
    p session[:target_user]
    p @post = @user.posts.create(post_params)

    p @post.update(target_user: session[:target_user])
    p @post
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    if !session[:user_id]
      redirect_to '/login'
    end
   end

  def show

  end

  def edit
    @user = User.find(session[:user_id])
    if @user.id != @post.user_id
      redirect_to posts_url
      flash[:notice] = "This is not your post!"
    end
  end

  def update
    @user = User.find(session[:user_id])
    @post.update(post_params) if @user.id == @post.user_id
    redirect_to posts_url
  end

  def destroy
    @user = User.find(session[:user_id])
    if @user.id == @post.user_id
        @post.destroy
    else
      flash[:notice] = "This is not your post!"
    end
    redirect_to posts_url
 end

  private

  def post_params
    params.require(:post).permit(:message, @target_user)
  end

  def current_post
    begin
      @post = Post.find(params[:id])
    rescue
      redirect_to '/'
    end
  end
end
