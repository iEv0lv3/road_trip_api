class Api::V1::ForecastController < ApplicationController
  def new
    new_forecast = ForecastFacade.new(params[:location])
    render json: ExtendedForecastSerializer.new(new_forecast.extended_forecast).serializable_hash
  end
end
