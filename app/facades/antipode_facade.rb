require './app/models/location'
require './app/models/forecast'
require './app/models/antipode'

class AntipodeFacade
  attr_reader :geo,
              :reverse_geo

  def initialize(location)
    @geo = ForecastFacade.new(location)
    @service = AntipodeService.new
    @antipode = @service.antipode_location(@geo.geo_location.lat, @geo.geo_location.long)
    @geo_service = GeocodeService.new
    @reverse_geo = @geo_service.reverse_location_data(@antipode[:data][:attributes][:lat], @antipode[:data][:attributes][:long])
    @location = Location.new(@reverse_geo[:results][0][:geometry][:location][:lat], @reverse_geo[:results][0][:geometry][:location][:lng])
    @weather_service = WeatherService.new
    @weather = @weather_service.weather_data(@reverse_geo[:results][0][:geometry][:location][:lat], @reverse_geo[:results][0][:geometry][:location][:lng])
  end
end
