class AddCharacterTypeToSheet < ActiveRecord::Migration[6.0]
  def change
    add_reference :sheets, :character_type, foreign_key: true
  end
end
