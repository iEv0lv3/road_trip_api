class PexelsImage
  attr_reader :image_url,
              :id

  def initialize(location)
    @id = nil
    @pexels_service = PexelsService.new
    @response = @pexels_service.find_image(location)
    @image_url = @response[:photos][0][:src][:original]
  end
end
