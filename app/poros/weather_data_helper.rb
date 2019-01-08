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

  def current_weather
    @weather_data[:currently]
  end

  def daily_weather
    @weather_data[:daily]
  end

  def hourly_weather
    @weather[:hourly]
  end
end
