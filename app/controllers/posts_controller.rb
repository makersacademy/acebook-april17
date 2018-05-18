class PostsController < ApplicationController

  before_action :authenticate_user!, except: :index

  def new
    @post = current_user.posts.new
    @target_user = User.find(params[:wall_id])
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :wall_id)
  end
end
