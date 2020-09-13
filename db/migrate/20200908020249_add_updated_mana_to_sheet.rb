class AddUpdatedManaToSheet < ActiveRecord::Migration[6.0]
  def change
    add_column :sheets, :updated_mana, :integer
  end
end
