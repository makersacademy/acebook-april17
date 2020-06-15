# frozen_string_literal: true

# Comments helper module
module CommentsHelper
  def comment_not_authorised?
    @comment.user_id != current_user.id
  end

  def comment_not_editable?
    Time.now > (@comment.updated_at + 10.minutes)
  end
end
