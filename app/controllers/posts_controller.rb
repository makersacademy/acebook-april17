class PostsController < ApplicationController
 # before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :find_post, only: [:edit, :update]


class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def create
   if post.likes.create(user: current_user)
     redirect_to post_redirect(post), :notice => 'Liked!'
   else
     redirect_to post_redirect(post), :alert => 'An error prevented you from liking this post!'
   end
  end

  def index
    @posts = Post.all.reverse
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "The post has been deleted."
  end

  def show
     @post = Post.find(params[:id])
	end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
     flash[:notice] = "Post was updated"
     redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def find_post
   @post = Post.find(params[:id])
 end

end
