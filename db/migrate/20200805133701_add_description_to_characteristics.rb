class AddDescriptionToCharacteristics < ActiveRecord::Migration[6.0]
  def change
    add_column :characteristics, :description, :string
  end
end
