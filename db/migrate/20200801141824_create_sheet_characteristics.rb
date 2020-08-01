class CreateSheetCharacteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :sheet_characteristics do |t|
      t.belongs_to :sheet
      t.belongs_to :characteristic
      t.integer :quantity
      t.timestamps
    end
  end
end
