class Inventory < ApplicationRecord
  belongs_to :sheet
  belongs_to :item

  def self.create_or_update(item_id:, quantity:)
    inventory = find_or_create_by!(item_id: item_id)
    inventory.update_attributes(quantity: inventory.quantity + quantity)
  end
end
