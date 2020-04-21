require 'rails_helper'
require './app/services/pexels_service'

RSpec.describe 'Pexels service', :vcr, type: :request do
  before :each do
    @location = 'Denver, CO'
    @pexels_facade = PexelsImageFacade.new(@location)
  end

  it 'api connection successful', :vcr do
    get "/api/v1/backgrounds?location=#{@location}"

    expect(response).to be_successful

    image_response = JSON.parse(response.body, symbolize_names: true)

    expect(image_response[:data][:type]).to eq('pexels_image')
    expect(image_response[:data][:attributes][:image_url]).to eq('https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg')
  end

  it 'returns an image url' do
    expect(@pexels_facade.image.image_url).to eq("https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg")
  end
end
