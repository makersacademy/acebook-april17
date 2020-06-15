# frozen_string_literal: true

class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = current_user.posts.build 
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
   
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc).all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
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
