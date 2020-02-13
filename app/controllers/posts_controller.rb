class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    authenticate_user
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def authenticate_user
    if !user_signed_in?
      redirect_to '/'
   end
  end

end
