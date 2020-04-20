class Location
  attr_reader :lat,
              :long

  def initialize(location)
    @geo_service = GeocodeService.new
    @response = @geo_service.find_location(location)
    @lat = @response[:results][0][:geometry][:location][:lat]
    @long = @response[:results][0][:geometry][:location][:lng]
  end
end
