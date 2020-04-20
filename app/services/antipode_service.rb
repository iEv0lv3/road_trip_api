class AntipodeService

  def antipode_location(lat, long)
    response = connection.get('/api/v1/antipodes?') do |faraday|
      faraday.params['lat'] = lat
      faraday.params['long'] = long
    end
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'http://amypode.herokuapp.com') do |faraday|
      faraday.headers['api_key'] = Figaro.env.antipode_api_key
    end
  end
end
