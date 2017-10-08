class TvChannel < ApplicationCable::Channel
  # クライアントと接続された時
  def subscribed
    stream_from "tv:message"
  end

  # クライアントとの接続が解除された時
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def put_message
    TvChannel.broadcast_to("message", "hello")
  end
end
