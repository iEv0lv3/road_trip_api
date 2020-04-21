class RoadTripFacade
  attr_reader :trip,
              :trip_duration

  def initialize(trip_params)
    @origin = trip_params[:origin]
    @destination = trip_params[:destination]
    @trip_duration = MapsService.new.directions(@origin, @destination)
    @trip_forecast = ForecastFacade.new(@destination).weather
    @trip = RoadTrip.new(trip_params, @trip_duration, @trip_forecast)
  end
end
