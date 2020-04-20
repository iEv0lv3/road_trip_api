class Forecast
  attr_reader :response

  def initialize(location)
    @weather_service = WeatherService.new
    @response = @weather_service.weather_data(location.lat, location.long)
  end
end
