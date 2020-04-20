class Forecast
  attr_reader :forecast

  def initialize(location_forecast)
    @forecast = location_forecast
  end
end
