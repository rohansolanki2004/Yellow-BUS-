class BookingsController < ApplicationController
  
  def index
      @schedules = Schedule.all
  end

  def show
  end
  
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @booking = Booking.new
    booked_seat_ids = Ticket.joins(:booking).where(bookings: { schedule_id: @schedule.id }).pluck(:seat_id)
    @seats = @schedule.bus.seats
    @booked_seat_ids = booked_seat_ids 
  end

  def create
    @schedule = Schedule.find(params[:schedule_id])
    seat_ids = params[:booking][:seat_ids].reject(&:blank?)
    #binding.pry
    ActiveRecord::Base.transaction do
      @booking = current_user.bookings.create!(schedule: @schedule)
      seat_ids.each do |seat_id|
        if Ticket.joins(:booking).where(seat_id: seat_id, bookings: { schedule_id: @schedule.id }).exists?
          raise ActiveRecord::RecordInvalid, "Seat already booked"
        end
        @booking.tickets.create!(seat_id: seat_id)
      end
    end
    redirect_to @booking, notice: "Booking successful"
    rescue => e
     redirect_to new_schedule_booking_path(@schedule), alert: e.message
  end


  def edit
  end

end
