class ExtendedForecast
  attr_reader :location,
              :current_temp,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :current_sunrise,
              :current_sunset,
              :id,
              :current_description,
              :hourly_forecast,
              :daily_forecast

  def initialize(location, weather)
    @weather = weather
    @id = nil
    @location = location
    @current_temp = my_current_temp
    @feels_like = my_current_feels_like
    @humidity = my_current_humidity
    @visibility = my_current_visibility
    @uv_index = my_current_uv_index
    @current_sunrise = my_current_sunrise
    @current_sunset = my_current_sunset
    @current_description = my_current_description
    @hourly_forecast = my_hourly_forecast
    @daily_forecast = my_daily_forecast
  end

  private

  def my_current_temp
    @weather[:current][:temp]
  end

  def my_current_feels_like
    @weather[:current][:feels_like]
  end

  def my_current_humidity
    @weather[:current][:humidity]
  end

  def my_current_visibility
    @weather[:current][:visibility]
  end

  def my_current_uv_index
    @weather[:current][:uvi]
  end

  def my_current_sunrise
    @weather[:current][:sunrise]
  end

  def my_current_sunset
    @weather[:current][:sunset]
  end

  def my_current_description
    @weather[:current][:weather].first[:main]
  end

  def my_hourly_forecast
    @weather[:hourly].each_with_object(Hash.new({})) do |weather, hourly|
      hourly[weather[:dt]] = {
        temp: weather[:temp],
        weather: weather[:weather]
      }
    end
  end

  def my_daily_forecast
    @weather[:daily].each_with_object(Hash.new({})) do |weather, daily|
      daily[weather[:dt]] = {
        max_temp: weather[:temp][:max],
        min_temp: weather[:temp][:min],
        weather: weather[:weather],
        rain: weather[:rain]
      }
    end
  end
end
