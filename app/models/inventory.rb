class Inventory < ApplicationRecord
  belongs_to :sheet
  belongs_to :item

  def self.create_or_update(item_id:, quantity:)
    inventory = find_or_create_by!(item_id: item_id)
    actual_quantity = inventory.quantity.nil? ? 0 : inventory.quantity
    inventory.update_attributes(quantity: actual_quantity + quantity)
  end
end
