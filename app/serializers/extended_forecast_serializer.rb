class ExtendedForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :location,
              :current_temp,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :current_sunrise,
              :current_sunset,
              :current_description,
              :hourly_forecast,
              :daily_forecast
end
