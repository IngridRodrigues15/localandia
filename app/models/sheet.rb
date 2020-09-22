class Sheet < ApplicationRecord
  belongs_to :character_type

  has_many :inventories
  has_many :items, through: :inventory

  has_many :sheet_characteristics
  has_many :player_characteristics, through: :sheet_characteristics


  def vitality
    vitality = Characteristic.where(name: "Vitalidade")
    self.sheet_characteristics.find_by(characteristic: vitality).quantity
  end

  def knowledge
    vitality = Characteristic.where(name: "Conhecimento")
    self.sheet_characteristics.find_by(characteristic: vitality).quantity
  end

  def charisma
    vitality = Characteristic.where(name: "Carisma")
    self.sheet_characteristics.find_by(characteristic: vitality).quantity
  end

  def define_player_life_points
    life = 25 + self.vitality
    self.life = life
    self.updated_life = life
    self.save
  end

  def define_player_mana_points
    mana = 5
    if self.character_type.name.eql? "Maga"
      mana = 5 + knowledge
    elsif self.character_type.name.eql? "Sacerdotisa"
      mana = charisma + knowledge
    end
    self.mana = mana
    self.updated_mana = mana
    self.save
  end

  def deduct_rubies(quantity, item_price)
    remaining = self.rubies - (quantity * item_price)
    self.update_attributes(rubies: remaining)
  end
end
