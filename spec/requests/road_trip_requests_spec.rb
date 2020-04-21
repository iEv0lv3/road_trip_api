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
  end
end
