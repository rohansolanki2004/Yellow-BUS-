class RouteStop < ApplicationRecord
  belongs_to :route
  belongs_to :stop

    before_create :set_position

  def set_position
    self.position = (route.route_stops.maximum(:position) || 0) + 1
  end

  default_scope { order(:position) }
end
