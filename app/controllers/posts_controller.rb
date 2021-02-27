# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p params
    @post = Post.create(post_params) { |params| params.user_id = current_user.id } #change here
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to(post_path(post))
  end

  def show
    redirect_to posts_url
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
