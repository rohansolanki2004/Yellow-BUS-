class SchedulesController < ApplicationController
 before_action :require_login
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_bus
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = @bus.schedules.includes(:route)
  end

  def show
  end

  def new
    @schedule = @bus.schedules.new
  end

  def create
    @schedule = @bus.schedules.new(schedule_params)

    if @schedule.save
      redirect_to [@bus, @schedule], notice: "Schedule created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to [@bus, @schedule], notice: "Schedule updated"
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to bus_schedules_path(@bus), notice: "Schedule deleted"
  end

  private

  def set_bus
    @bus = Bus.find(params[:bus_id])
  end

  def set_schedule
    @schedule = @bus.schedules.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:route_id, :departure_time, :arrival_time)
  end
end