class RoadTripFacade
  attr_reader :trip

  def initialize(trip_params)
    @origin = trip_params[:origin]
    @destination = trip_params[:destination]
    @api_key = trip_params[:api_key]
    @trip_duration = MapsService.new.directions(@origin, @destination)
    @trip_forecast = ForecastFacade.new(@destination).weather
    @trip = RoadTrip.new(trip_params, @trip_duration, @trip_forecast)
  end
end
