require './app/models/location'
require './app/models/forecast'
require './app/models/antipode'

class AntipodeFacade
  attr_reader :service

  def initialize(lat, long)
    @service = AntipodeService.new
    @antipode = @service.antipode_location(lat, long)
  end
end
