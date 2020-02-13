# frozen_string_literal: true
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def destroy
    Post.find(delete_params).destroy
    # @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :time)
  end

  def delete_params
    params.require(:id)
  end
end 