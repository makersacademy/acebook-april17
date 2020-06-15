class CommentsController < ApplicationController

  def create
    @comment = Comment.create( {"text" => params[:comment][:text],
      "username" => current_user.username,
      "post_id" => params[:comment][:post_id] } )
    redirect_back(fallback_location: root_path)
  end

end
