require 'rails_helper'

class WeatherDataHelper
  def initialize(location)
    google_data = GoogleMapsService.new
    coordinates = google_data.get_coordinates(location)
    darkskyservice = DarkskyService.new
    @weather_data = darkskyservice.get_forcast(coordinates[:lat], coordinates[:lng])
  end

  def weather_data
    @weather_data
  end

  def most_current_weather
    CurrentWeather.new(@weather_data)
  end

  def daily_weather
    DailyWeather.new(@weather_data)
  end

  def hourly_weather
    HourlyWeather.new(@weather_data)
  end
end
