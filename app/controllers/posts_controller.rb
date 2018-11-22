class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p current_user
    @post = Post.create(post_params.merge({user_id: current_user.id}))
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
