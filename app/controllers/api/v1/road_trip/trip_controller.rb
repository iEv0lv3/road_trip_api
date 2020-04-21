class Api::V1::RoadTrip::TripController < ApplicationController
  def new
    trip = RoadTripFacade.new(trip_params)
  end

  private

  def trip_params
    params.require(:user).permit(:origin, :destination, :api_key)
  end
end
