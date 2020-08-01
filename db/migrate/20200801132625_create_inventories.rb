class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.belongs_to :sheet
      t.belongs_to :item
      t.integer :quantity
      t.timestamps
    end
  end
end
