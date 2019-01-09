class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :most_current_weather, :daily_weather, :hourly_weather
end
