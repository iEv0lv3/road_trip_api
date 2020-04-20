require './app/models/location'
require './app/models/forecast'
require './app/models/pexels_image'

class ForecastFacade
  attr_reader :location,
              :weather,
              :extended_forecast,
              :location_coordinates

  def initialize(location)
    @location = location
    @geo_service = GeocodeService.new
    @geo_location = @geo_service.find_location(location)
    @location_coordinates = Location.new(@geo_location)
    @weather_service = WeatherService.new
    @weather = Forecast.new(@weather_service.weather_data(@location_coordinates))
    @extended_forecast = ExtendedForecast.new(location, @weather.forecast)
  end
end
