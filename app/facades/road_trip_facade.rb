class RoadTripFacade
  attr_reader :trip,
              :trip_duration

  def initialize(trip_params)
    @origin = trip_params[:origin]
    @destination = trip_params[:destination]
    @trip_duration = get_trip_duration
    @trip_forecast = ForecastFacade.new(@destination).weather
    @trip = RoadTrip.new(trip_params, @trip_duration, @trip_forecast)
  end

  def get_trip_duration
    response = MapsService.new.directions(@origin, @destination)
    response[:routes][0][:legs][0][:duration]
  end
end
