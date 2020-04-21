class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(trip_params, trip_duration, forecast)
    @origin = trip_params[:origin]
    @destination = trip_params[:destination]
    @travel_time = trip_duration[:text]
    @destination_weather = forecast
    @epoch_duration = trip_duration[:value]
    @arrival_forecast = destination_weather
  end

  def destination_weather
    epoch_travel_time = (@epoch_duration / 3600.00).round
    arrival_hour = @destination_weather.forecast[:hourly][epoch_travel_time + 1]
    [arrival_hour[:temp], arrival_hour[:weather][0][:main]]
  end
end
