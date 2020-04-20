class WeatherService
  def weather_data(lat, long)
    response = connection.get('/data/2.5/onecall') do |faraday|
      faraday.params['lat'] = lat
      faraday.params['lon'] = long
      faraday.params['units'] = 'imperial'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = Figaro.env.weather_api_key
    end
  end
end
