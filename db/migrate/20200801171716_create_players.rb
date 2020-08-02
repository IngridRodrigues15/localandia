class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.belongs_to :sheet, null: true
      t.belongs_to :user

      t.string :nome
      t.string :type

      t.timestamps
    end
  end
end
