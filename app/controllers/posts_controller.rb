# frozen_string_literal: true

# defines posts and thier routes
class PostsController < ApplicationController
  # require 'pry'
  before_action :authenticate_user!

  def index
    @posts = Post.all.order('updated_at DESC')
  end

  def new
    # build doesn't save to DB like new doesn't. For saving
    # we need to use create
    @post = current_user.posts.build
  end

  def create
    # binding.pry
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
