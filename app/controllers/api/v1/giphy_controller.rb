class Api::V1::GiphyController < ApplicationController
  def index
    google_data = GoogleMapsService.new
    coordinates = google_data.get_coordinates(params[:location])
    darkskyservice = DarkskyService.new
    weather_data = darkskyservice.get_forcast(coordinates[:lat], coordinates[:lng])

    gif_service = GiphyService.new
    gif_data = gif_service.get_gifs(weather_data[:daily][:data][1][:summary])
    gif_url =  gif_data[:data][0][:url]


    # render json: day_gif_data
  end
end
