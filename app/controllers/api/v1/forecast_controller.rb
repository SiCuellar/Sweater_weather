class Api::V1::ForecastController < ApplicationController
  def show
    google_data = GoogleMapsService.new
    coordinates = google_data.get_coordinates(params[:location])
    darkskyservice = DarkskyService.new
    weather_data = darkskyservice.get_forcast(coordinates[:lat], coordinates[:lng])
    return weather_data
  end
end
