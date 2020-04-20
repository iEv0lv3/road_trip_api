Rails.application.routes.draw do
  get '/api/v1/forecast', to: 'api/v1/forecast/forecast#new'
  get '/api/v1/backgrounds', to: 'api/v1/background/image#new'
  get '/api/v1/antipode', to: 'api/v1/antipode/antipode#new'
end
