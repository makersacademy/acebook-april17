class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to posts_url
  end

  def index
    @post = current_user.posts.build
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to posts_url && return unless @post.user_id == current_user.id
    @post.destroy
    redirect_to posts_url
  end

  def update
  @post = Post.find params[:id]

  respond_to do |format|
    if @post.update_attributes(post_params)
      format.html { redirect_to(@post, :notice => 'Posts was successfully updated.') }
      format.json { respond_with_bip(@post) }
    else
      format.html { render :action => "edit" }
      format.json { respond_with_bip(@post) }
    end
  end
end


  private

  def post_params
    params.require(:post).permit(:message)
  end
end
