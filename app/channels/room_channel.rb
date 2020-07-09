class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    p (data)
    current_user.messages.create(content: data['message'])
  end

  private
  def message_params
    params.require(:post).permit(:message, :user_id)
  end
end
