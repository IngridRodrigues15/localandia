class Player < ApplicationRecord
  belongs_to :user
  belongs_to :sheet
  belongs_to :game
end
