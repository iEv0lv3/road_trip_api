class Api::V1::ImageController < ApplicationController
  def new
    new_image = PexelsImageFacade.new(params[:location])
    render json: PexelsImageSerializer.new(new_image.pexels).serializable_hash
  end
end
