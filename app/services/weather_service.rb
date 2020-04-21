class WeatherService
  def weather_data(location)
    Rails.cache.fetch(location, expires_in: 1.hours) do
      @response = connection.get('/data/2.5/onecall') do |faraday|
        faraday.params['lat'] = location.lat
        faraday.params['lon'] = location.long
        faraday.params['units'] = 'imperial'
      end
    end

    JSON.parse(@response.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = Figaro.env.weather_api_key
    end
  end
end
