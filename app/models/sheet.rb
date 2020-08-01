class Sheet < ApplicationRecord
  belongs_to :character_type

  has_many :inventories
  has_many :items, through: :inventory

  has_many :sheet_characteristics
  has_many :player_characteristics, through: :sheet_characteristics
end
