class Api::V1::ImageController < ApplicationController
  def new
    pexels = PexelsImageFacade.new(params[:location])
    render json: PexelsImageSerializer.new(pexels.image).serializable_hash
  end
end
