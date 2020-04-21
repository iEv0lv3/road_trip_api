class MapsService
  def directions(origin, destination)
    response = connection.get('/maps/api/directions/json') do |faraday|
      faraday.params['origin'] = origin
      faraday.params['destination'] = destination
    end

    response = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = Figaro.env.google_api_key
    end
  end
end
