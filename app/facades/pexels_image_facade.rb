class PexelsImageFacade
  attr_reader :image

  def initialize(location)
    @pexels_image = PexelsService.new.find_image(location)
    @image = PexelsImage.new(@pexels_image)
  end
end
