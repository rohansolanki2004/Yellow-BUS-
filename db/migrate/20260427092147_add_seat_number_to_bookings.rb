class AddSeatNumberToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :seat_number, :integer
  end
end
