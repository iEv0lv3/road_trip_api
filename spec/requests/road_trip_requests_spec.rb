require 'rails_helper'

RSpec.describe 'Road Trip API', :vcr, type: :request do
  it 'successful trip request' do
    user = User.create!(
      email: 'mobama@mail.com',
      password: 'password'
    )

    post "/api/v1/road_trip", params: {
      user: {
        origin: 'Denver, CO',
        destination: 'Pueblo, CO',
        api_key: user.api_key
      }
    }

    expect(response).to be_successful
  end

  it 'unsuccessful trip request' do
    post "/api/v1/road_trip", params: {
      user: {
        origin: 'Denver, CO',
        destination: 'Pueblo, CO',
        api_key: ''
      }
    }

    expect(response).to_not be_successful
    expect(response.body).to include('Please enter a valid API Key')
  end
end
