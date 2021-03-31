# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    not_signed_in_redirect
    @post = Post.new
  end

  def create
    not_signed_in_redirect
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    not_signed_in_redirect
    @user = current_user
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  
  private

  def post_params
    params.require(:post).permit(:message)
  end
end
