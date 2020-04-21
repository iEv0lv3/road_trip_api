Rails.application.routes.draw do
  get '/api/v1/forecast', to: 'api/v1/forecast/forecast#new'
  get '/api/v1/backgrounds', to: 'api/v1/background/image#new'
  post '/api/v1/users', to: 'api/v1/users/users#create'
  post '/api/v1/sessions', to: 'api/v1/users/sessions#create'
  post '/api/v1/road_trip', to: 'api/v1/road_trip/trip#new'

  # namespace :api do
  #   namespace :v1 do
  #     get '/forecast', to: '/forecast/forecast#new'
  #     get '/backgrounds', to: '/background/image#new'
  #     post '/users', to: '/users/users#create'
  #     post '/sessions', to: '/users/sessions#create'
  #     post '/road_trip', to: '/road_trip/trip#new'
  #   end
  # end
end
