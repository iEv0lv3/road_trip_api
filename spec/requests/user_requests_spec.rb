require 'rails_helper'

RSpec.describe 'Users API', :vcr, type: :request do
  it 'successful register request' do
    post "/api/v1/users", params: {
      user: {
        email: 'whatever2@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }

    expect(response).to be_successful

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:data][:type]).to eq('user')
    expect(user_response[:data][:attributes][:email]).to eq('whatever2@example.com')
    expect(user_response[:data][:attributes][:api_key]).to_not eq(nil)
  end

  it 'unsuccessful register request' do
    post "/api/v1/users", params: {
      user: {
        email: 'whatever2@example.com'
      }
    }

    expect(response.status).to eq(400)
    expect(response).to_not be_successful
  end

  it 'successful login request' do
    User.create!(
      email: 'wowemail@mail.com',
      password: 'password'
    )

    post "/api/v1/sessions", params: {
      user: {
        email: 'wowemail@mail.com',
        password: 'password'
      }
    }

    expect(response).to be_successful

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:data][:type]).to eq('user')
    expect(user_response[:data][:attributes][:email]).to eq('wowemail@mail.com')
  end

  it 'unsuccessful login request' do
    User.create!(
      email: 'wowemail@mail.com',
      password: 'password'
    )

    post "/api/v1/sessions", params: {
      user: {
        email: 'wowemail@mail.com',
      }
    }

    expect(response.status).to eq(400)
    expect(response.body).to include('User credentials incorrect')
  end
end
