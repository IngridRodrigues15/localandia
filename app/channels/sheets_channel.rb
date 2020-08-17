class SheetsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'sheet_attributes'
  end
end
