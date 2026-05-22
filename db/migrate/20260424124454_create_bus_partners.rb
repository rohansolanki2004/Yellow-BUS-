class CreateBusPartners < ActiveRecord::Migration[7.1]
  def change
    create_table :bus_partners do |t|
      t.string :name
      t.string :contact_information

      t.timestamps
    end
  end
end
