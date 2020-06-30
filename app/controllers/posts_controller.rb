# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new

  end

  def create
    @post = Post.create(post_params)
    puts post_params
    puts @post.save
    puts @post.errors.full_messages
    puts 'CREATE'
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def remove

  end 

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
