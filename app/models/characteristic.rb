class Characteristic < ApplicationRecord
  has_many :sheet_characteristics
  has_many :sheets, through: :sheet_characteristic
end
