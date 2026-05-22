class Route < ApplicationRecord
    has_many :route_stops, dependent: :destroy
    has_many :stops, through: :route_stops
    has_many :schedules,dependent: :destroy


   def assign_stops
  return if stop_ids.blank?

  stop_ids.each_with_index do |stop_id, index|
    route_stops.create!(
      stop_id: stop_id,
      position: index + 1
    )
  end
end

  def display_name
    "#{start_location} → #{destination}"
  end
end
