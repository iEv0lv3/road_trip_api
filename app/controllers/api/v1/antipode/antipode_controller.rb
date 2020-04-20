class Api::V1::Antipode::AntipodeController < ApplicationController
  def new
    new_antipode = AntipodeFacade.new(params[:location])
    render json: AntipodeSerializer.new(new_antipode).serializable_hash
  end
end
