class Schedule < ApplicationRecord
  belongs_to :bus
  belongs_to :route
  has_many :bookings 

  validates :departure_time , :arrival_time, presence: true 
end
