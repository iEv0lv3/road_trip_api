require 'rails_helper'
require './app/services/antipode_service'
# require './app/facades/antipode_facade'

RSpec.describe 'Antipodes API', :vcr, type: :request do
  before :each do
    @location = 'Hong Kong'
    @geo = ForecastFacade.new(@location)
    @antipode_facade = AntipodeFacade.new(@geo.geo_location.lat, @geo.geo_location.long)
  end

  it 'Connect to service successfully' do
    binding.pry
  end
end
