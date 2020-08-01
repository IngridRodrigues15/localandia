class Player < ApplicationRecord
  belongs_to :user
  belongs_to :sheet, required: false
  belongs_to :game, required: false
end
