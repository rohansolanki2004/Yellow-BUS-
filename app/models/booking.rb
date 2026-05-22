class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  has_many:tickets
  #validates :booking_date, :total_ammount, :status, :ticket_count, presence: true

  #validates :total_ammount, numericality: { greater_than_or_equal_to: 0 }
 # validates :ticket_count, numericality: { only_integer: true, greater_than: 0 }

  #validates :status, inclusion: { in: %w[pending confirmed cancelled] }

  #validates :seat_number, presence: true

  #validates :seat_number, uniqueness: {scope: :schedule_id, message: "is already booked for this schedule" }
end   