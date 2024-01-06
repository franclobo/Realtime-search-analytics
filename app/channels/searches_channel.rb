class SearchesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'searches_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
