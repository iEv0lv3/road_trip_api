class PexelsService
  def find_image(location)
    Rails.cache.fetch('recent_image', expires_in: 6.hours) do
      @response = connection.get("/v1/search?") do |faraday|
        faraday.params['query'] = location
        faraday.params['page'] = 1
        faraday.params['per_page'] = 1
      end
    end

    JSON.parse(@response.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(url: 'https://api.pexels.com/v1') do |faraday|
      faraday.headers['authorization'] = Figaro.env.pexels_api_key
    end
  end
end
