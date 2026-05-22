class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.string :seat_type
      t.integer :seat_number
      t.references :bus, null: false, foreign_key: true
      t.integer :position_deck

      t.timestamps
    end
  end
end
