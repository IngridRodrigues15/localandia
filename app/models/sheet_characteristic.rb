class SheetCharacteristic < ApplicationRecord
  belongs_to :sheet
  belongs_to :characteristic

  validates :quantity, numericality: { less_than_or_equal_to: 9,  only_integer: true }

  def self.create_or_update(characteristic_id:, quantity:)
    characteristic = find_by(characteristic_id: characteristic_id)
    if characteristic.nil?
      create(characteristic_id: characteristic_id, quantity: quantity)
    else
      characteristic.update_attributes(quantity: quantity)
    end
  end
end
