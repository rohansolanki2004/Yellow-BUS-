class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.string :bus_number
      t.integer :level
      t.string :bus_type
      t.integer :capacity
      t.references :bus_partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
