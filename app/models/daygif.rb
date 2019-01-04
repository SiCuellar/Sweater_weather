class Daygif
  def initialize(location)
    @location = location
  end

  def get_coords
    google_data = GoogleMapsService.new
    coordinates = google_data.get_coordinates(@location)
  end

  def get_weather_data
    darkskyservice = DarkskyService.new

    weather_data = darkskyservice.get_forcast(39.7392358,-104.990251)
  end
  # gif_service = GiphyService.new
  # gif_data = gif_service.get_gifs(weather_data[:daily][:data][1][:summary])
  # gif_url =  gif_data[:data][0][:url]



end
