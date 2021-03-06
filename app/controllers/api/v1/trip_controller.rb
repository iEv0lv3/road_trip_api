class Api::V1::TripController < ApplicationController
  def create
    user = User.find_by(api_key: trip_params[:api_key])
    if !user.nil?
      road_trip = RoadTripFacade.new(trip_params)
      render json: RoadTripSerializer.new(road_trip.trip), status: 201
    else
      render json: 'Please enter a valid API Key', status: 401
    end
  end

  private

  def trip_params
    params.require(:user).permit(:origin, :destination, :api_key)
  end
end
