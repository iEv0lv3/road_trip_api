require 'rails_helper'
require './app/services/geocode_service'
require './app/services/weather_service'

RSpec.describe 'Forecast Service', type: :request do
  before :each do
    @location = 'Denver, CO'
    @forecast = ForecastFacade.new(@location)
  end

  it 'returns city lat and long', :vcr do
    expect(@forecast.geo_location.lat).to eq(39.7392358)
    expect(@forecast.geo_location.long).to eq(-104.990251)
  end

  it 'returns weather forecast lat and long', :vcr do
    expect(@forecast.weather_forecast.response[:lat]).to eq(39.74)
    expect(@forecast.weather_forecast.response[:lon]).to eq(-104.99)
  end

  it 'expect forecast request success', :vcr do
    get "/api/v1/forecast?location=#{@location}"

    expect(response).to be_successful
  end
end
