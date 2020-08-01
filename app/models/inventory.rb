class Inventory < ApplicationRecord
  belongs_to :sheet
  belongs_to :item
end
