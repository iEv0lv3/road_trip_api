class Location
  attr_reader :lat,
              :long

  def initialize(response)
    @lat = response[:results][0][:geometry][:location][:lat]
    @long = response[:results][0][:geometry][:location][:lng]
  end
end
