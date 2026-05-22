class AddUniqueSeatIndex < ActiveRecord::Migration[7.1]
  def change
     add_index :bookings, [:schedule_id, :seat_number], unique: true
  end
end
