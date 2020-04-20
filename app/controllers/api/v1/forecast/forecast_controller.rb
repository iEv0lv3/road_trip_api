class Api::V1::Forecast::ForecastController < ApplicationController
  def new
    @forecast = ForecastFacade.new(params[:location])
  end
end
