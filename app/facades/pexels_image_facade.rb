class PexelsImageFacade
  attr_reader :pexels,
              :image

  def initialize(location)
    @pexels = PexelsImage.new(location)
    @image = @pexels.image_url
  end
end
