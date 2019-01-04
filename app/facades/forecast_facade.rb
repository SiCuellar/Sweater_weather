class ForecastFacade
  def initialize(location)
    google_data = GoogleMapsService.new
    coordinates = google_data.get_coordinates(location)
    darkskyservice = DarkskyService.new
    weather_data = darkskyservice.get_forcast(coordinates[:lat], coordinates[:lng])
  end
end
