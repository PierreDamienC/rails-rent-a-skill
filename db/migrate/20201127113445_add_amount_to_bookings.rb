class AddAmountToBookings < ActiveRecord::Migration[6.0]
  def change
    add_monetize :bookings, :amount, currency: {present: false}
  end
end
