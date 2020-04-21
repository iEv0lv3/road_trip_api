require 'rails_helper'
require './app/services/geocode_service'
require './app/services/weather_service'

RSpec.describe 'Forecast Service', type: :request do
  before :each do
    @location = 'Denver, CO'
    @forecast = ForecastFacade.new(@location)
  end

  it 'returns city lat and long', :vcr do
    expect(@forecast.location_coordinates.lat).to eq(39.7392358)
    expect(@forecast.location_coordinates.long).to eq(-104.990251)
  end

  it 'returns weather forecast lat and long', :vcr do
    expect(@forecast.weather.forecast[:lat]).to eq(39.74)
    expect(@forecast.weather.forecast[:lon]).to eq(-104.99)
  end

  it 'expect forecast request success', :vcr do
    get "/api/v1/forecast?location=#{@location}"

    expect(response).to be_successful

    forecast_data = JSON.parse(response.body, symbolize_names: true)

    expect(forecast_data[:data][:type]).to eq('extended_forecast')
    expect(forecast_data[:data][:attributes][:location]).to eq('Denver, CO')
    expect(forecast_data[:data][:attributes][:hourly_forecast].size).to eq(48)
    expect(forecast_data[:data][:attributes][:daily_forecast].size).to eq(8)
  end
end
