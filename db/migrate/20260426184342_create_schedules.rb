class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :bus, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true
      t.datetime :departure_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
