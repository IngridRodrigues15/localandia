class CreateSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :sheets do |t|
      t.integer :rubies
      t.integer :life
      t.integer :mana
      t.integer :heroic_points

      t.timestamps
    end
  end
end
