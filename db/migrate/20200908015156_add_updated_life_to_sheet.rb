class AddUpdatedLifeToSheet < ActiveRecord::Migration[6.0]
  def change
    add_column :sheets, :updated_life, :integer
  end
end
