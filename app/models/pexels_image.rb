class PexelsImage
  attr_reader :image_url,
              :id

  def initialize(location)
    @id = nil
    @image_url = location[:photos][0][:src][:original]
  end
end
