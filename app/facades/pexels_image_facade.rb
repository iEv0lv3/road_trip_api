class PexelsImageFacade
  attr_reader :pexels,
              :image

  def initialize(location)
    @pexels_service = PexelsService.new
    @pexels_image = @pexels_service.find_image(location)
    @image = PexelsImage.new(@pexels_image)
  end
end
