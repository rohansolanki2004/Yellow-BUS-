class BusesController < ApplicationController
     before_action :require_login
     before_action :require_admin
    before_action :set_bus, only: [:show, :edit, :update, :destroy]
  

    def index 
        @buses=Bus.all
    end

    def show
       @bus = Bus.includes(:seats).find(params[:id])
       @seats_by_deck = @bus.seats.order(:seat_number).group_by(&:position_deck)
    end                   

    def new
        @bus = Bus.new
    end 

    def create 
        @bus = Bus.new(bus_params)
        if @bus.save
          redirect_to @bus, notice: "Bus created"
        else
          render :new , status: :unprocessable_entity
        end
    end 

    def edit 
    end

    def update 
        if @bus.update(bus_params)
         redirect_to @bus, notice: "Bus updated"
        else
         render :edit
        end
    end 
    
    def destroy
        @bus.destroy
        redirect_to buses_path, notice: "Bus deleted"
    end 

  private

  def set_bus
    @bus = Bus.find(params[:id])
  end

  def bus_params
    params.require(:bus).permit(:bus_number,:level, :bus_type, :capacity ,:bus_partner_id)
  end
end
