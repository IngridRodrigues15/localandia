class Item < ApplicationRecord
  has_many :inventories
  has_many :sheets, through: :inventory
end
