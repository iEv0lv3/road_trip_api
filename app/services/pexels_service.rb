class PexelsService

  def find_image(location)
    response = connection.get("/v1/search?") do |faraday|
      faraday.params['query'] = location
      faraday.headers['authorization'] = Figaro.env.pexels_api_key
      faraday.params['page'] = 1
      faraday.params['per_page'] = 1
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://api.pexels.com/v1')
  end
end
