class CreateCharacterTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :character_types do |t|
      t.string :name
      t.text :skills
      t.text :weapons
      t.integer :mana

      t.timestamps
    end
  end
end
