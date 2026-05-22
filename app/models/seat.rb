class Seat < ApplicationRecord
  belongs_to :bus

  validates :seat_type, inclusion: { in: %w[seating sleeper] },presence: true
  validates :seat_number , presence: true 
  validates :position_deck  , presence: true 
end
