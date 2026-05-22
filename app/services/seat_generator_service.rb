class SeatGeneratorService
  def initialize(bus)
    @bus = bus
  end

  def call
    seats = []
    seat_number = 1
    total_decks = @bus.level 
    seats_per_deck = (@bus.capacity.to_f / total_decks).ceil
    total_decks.times do |deck_index|
      (1..seats_per_deck).each do
        break if seat_number > @bus.capacity
        seats << {
          bus_id: @bus.id,
          seat_number: seat_number,
          seat_type: @bus.bus_type,
          position_deck: deck_index + 1, 
          created_at: Time.current,
          updated_at: Time.current
        }
        seat_number += 1
      end
    end

    Seat.insert_all(seats) if seats.any?
  end
end