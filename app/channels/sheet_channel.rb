class SheetChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sheet_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
