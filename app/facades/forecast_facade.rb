require './app/models/location'
require './app/models/forecast'

class ForecastFacade
  attr_reader :location,
              :weather,
              :extended_forecast,
              :location_coordinates

  def initialize(location)
    @location = location

    @geo_location = GeocodeService.new.find_location(location)
    @location_coordinates = Location.new(@geo_location)

    @weather_service = WeatherService.new.weather_data(@location_coordinates)
    @weather = Forecast.new(@weather_service)
    @extended_forecast = ExtendedForecast.new(location, @weather.forecast)
  end
end
