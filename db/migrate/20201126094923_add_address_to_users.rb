class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :street, :string, default: "2, avenue des Champs-Elysées"
    add_column :users, :ZIP, :integer, default: "75000"
    add_column :users, :city, :string, default: "Paris"
    add_column :users, :country, :string, default: "France"
  end
end
