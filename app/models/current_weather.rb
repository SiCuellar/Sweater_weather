class CurrentWeather < ApplicationRecord
  def initialize(weather_data)
    @weather_data = weather_data
  end
end
