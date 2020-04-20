require 'rails_helper'
require './app/services/antipode_service'
# require './app/facades/antipode_facade'

RSpec.describe 'Antipodes API', :vcr, type: :request do
  before :each do
    @location = 'Hong Kong'
    @antipode_facade = AntipodeFacade.new(@location)
  end

  it 'Connect to service successfully' do
    get "/api/v1/antipode?location=#{@location}"

    expect(response).to be_successful
  end
end
