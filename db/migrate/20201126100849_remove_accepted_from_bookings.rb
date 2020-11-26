class RemoveAcceptedFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :accepted, :boolean
  end
end
