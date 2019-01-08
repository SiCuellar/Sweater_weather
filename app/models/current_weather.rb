class CurrentWeather < ApplicationRecord
  def initialize(weather_data)
    binding.pry
    @weather_data = weather_data
  end
end
