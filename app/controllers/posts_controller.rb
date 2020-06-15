class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create({ "text"=>params[:post][:text],
      "poster_username" => current_user.username, "recipient_username" =>
      params[:post][:recipient_username]})
    redirect_back(fallback_location: root_path)

  end

  def index
    @posts = Post.all
  end

  def edit
    @profile = User.find(params[:profile_id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to profile_post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
    @profile = User.find(params[:profile_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

end
