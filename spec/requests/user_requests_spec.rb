require 'rails_helper'

RSpec.describe 'Users API', :vcr, type: :request do
  it 'successful request' do
    post "/api/v1/users", params: {
      user: {
        email: 'whatever2@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }
  end
end
