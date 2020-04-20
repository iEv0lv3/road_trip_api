Rails.application.routes.draw do
  get '/api/v1/forecast', to: 'api/v1/forecast/forecast#new'
end
