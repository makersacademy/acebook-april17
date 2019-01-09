class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @params = comment_params
    @user = current_user
    @post = Post.find(id: @params.post_id)
    @comment = Comment.create(user_id: @user.id, post_id: @params.post_id, content: @params.content)
    redirect_to comments_url
  end

  def edit
     @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to comments_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:post_id)
  end

end
