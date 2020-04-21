class Api::V1::RoadTrip::TripController < ApplicationController
  def new
    user = User.find_by(params[:user][:api_key])
    if !user.nil?
      trip = RoadTripFacade.new(trip_params)
      render json: { status: 201, body: RoadTripSerializer.new(trip) }
    else
      render json: { status: 400, body: user.errors.full_messages.to_sentence }
    end
  end

  private

  def trip_params
    params.require(:user).permit(:origin, :destination, :api_key)
  end
end
