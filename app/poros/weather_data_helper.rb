require 'rails_helper'

class WeatherDataHelper
  attr_reader :location
  def initialize(location)
    @location = location
    google_data = GoogleMapsService.new
    coordinates = google_data.get_coordinates(location)
    darkskyservice = DarkskyService.new
    @weather_data = darkskyservice.get_forcast(coordinates[:lat], coordinates[:lng])
  end

  def weather_data
    @weather_data
  end

  def current_weather
    @weather_data[:currently]
  end

  def most_current_weather
    CurrentWeather.new(@weather_data)
  end

  def daily_weather
    days_weather = @weather_data[:daily][:data]
    all_days = days_weather.map do |day_data|
      DayWeather.new(day_data)
    end.first(8)
  end

  def hourly_weather
    hours_weather = @weather_data[:hourly][:data]
    all_hours = hours_weather.map do |hour_data|
      HourWeather.new(hour_data)
    end.first(8)
  end
end
