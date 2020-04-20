require './app/models/location'
require './app/models/forecast'

class ForecastFacade
  attr_reader :location,
              :geo_location,
              :weather_forecast

  def initialize(location)
    @location = location
    @geo_location = Location.new(location)
    @weather_forecast = Forecast.new(@geo_location)
  end
end
