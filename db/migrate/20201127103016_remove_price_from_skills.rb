class RemovePriceFromSkills < ActiveRecord::Migration[6.0]
  def change
    remove_column :skills, :price, :integer
  end
end
