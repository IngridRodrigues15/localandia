class Sheet < ApplicationRecord
  belongs_to :character_type
  has_many :inventories
  has_many :items, through: :inventory
end
