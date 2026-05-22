class Bus < ApplicationRecord
  after_create :generate_seats

  belongs_to :bus_partner
  has_many :seats, dependent: :destroy
  has_many :schedules, dependent: :destroy
   
  validates :bus_number , presence: true , uniqueness: true 
  validates :level, inclusion: { in: [1, 2] }
  validates :bus_type , presence: true , inclusion: { in: %w[seating sleeper] }
  validates :capacity ,presence: true ,inclusion: { in: 30..100 } ,numericality: { only_integer: true }

  private 
    def generate_seats
    SeatGeneratorService.new(self).call
  end
end
