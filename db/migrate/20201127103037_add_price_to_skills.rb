class AddPriceToSkills < ActiveRecord::Migration[6.0]
  def change
    add_monetize :skills, :price, currency: { present: false }
  end
end
