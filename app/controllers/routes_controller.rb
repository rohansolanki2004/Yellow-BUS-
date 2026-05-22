class RoutesController < ApplicationController
  before_action :require_login
  before_action :require_admin
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.includes(route_stops: :stop)
  end

  def show
    @route_stops = @route.route_stops.includes(:stop).order(:position)
  end

  def new
   @route = Route.new
   3.times { @route.route_stops.build }
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      assign_stops(@route)
      redirect_to @route, notice: "Route created successfully"
    else
      render :new
    end
  end

  def edit
    (3 - @route.route_stops.size).times { @route.route_stops.build }
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: "Route updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path, notice: "Route deleted"
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:start_location,:destination,stop_ids: [] )
  end

  def assign_stops(route)
    return unless params[:route][:route_stops_attributes]
    params[:route][:route_stops_attributes].each_with_index do |(_, rs), index|
    next if rs[:stop_id].blank?
    route.route_stops.create!(
      stop_id: rs[:stop_id],
      position: index + 1  
    )
  end
end
end