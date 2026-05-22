class AddPositionToRouteStops < ActiveRecord::Migration[7.1]
  def change
    add_column :route_stops, :position, :integer
  end
end
