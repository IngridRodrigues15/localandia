class SheetCharacteristic < ApplicationRecord
  belongs_to :sheet
  belongs_to :characteristic

  validates :quantity, numericality: { less_than_or_equal_to: 9,  only_integer: true }


end
