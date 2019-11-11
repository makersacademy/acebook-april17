class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @post = Post.where(id: params[:post_id])
    @@wall_id = @post.first.wall_id
    redirect_to "/#{@@wall_id}"
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(edit_params)
      redirect_to "/#{@comment.post.wall_id}"
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    Comment.destroy(params[:id])
    redirect_to "/#{@comment.post.wall_id}"
  end

  private

  def comment_params
    new_params = params.require(:comment).permit(:message)
    new_params.merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def edit_params
    params.require(:comment).permit(:message)
  end
end
