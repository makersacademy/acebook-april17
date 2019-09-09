# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :correct_user,   only: [:destroy, :edit]

  def new
    @post = Post.new
  end

  def edit
    @post = Post.where("id = ? and created_at >= ?", params[:id], 10.minutes.ago).first
    if @post.nil?
      flash[:danger] = "You can't edit a post created more than 10mins ago"
      redirect_to posts_url
    else
      @post
    end
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
      if @post.nil?
      flash[:danger] = "This isn't your post!"
      redirect_to '/posts'
      end
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
