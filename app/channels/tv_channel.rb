class TvChannel < ApplicationCable::Channel
  # クライアントと接続された時
  def subscribed
    stream_for current_user
  end

  # クライアントとの接続が解除された時
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
