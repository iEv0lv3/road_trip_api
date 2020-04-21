class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :forecast

  def initialize(trip_params, trip_duration, forecast)
    @origin = trip_params[:origin]
    @destination = trip_params[:destination]
    @duration = trip_duration
    @forecast = forecast
  end
end
