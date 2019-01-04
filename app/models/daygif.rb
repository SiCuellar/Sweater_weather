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

  def get_current_day_gif_url
    darkskyservice = DarkskyService.new
    weather_data = darkskyservice.get_forcast(39.7392358,-104.990251)
    gif_service = GiphyService.new
    gif_data = gif_service.get_gifs(weather_data[:daily][:data][0][:summary])
    gif_url =  gif_data[:data][0][:url]
  end

  def get_summary_all_days
    darkskyservice = DarkskyService.new
    weather_data = darkskyservice.get_forcast(39.7392358,-104.990251)

    gif_service = GiphyService.new

    daily_data = weather_data[:daily][:data]
    daily_summary = daily_data.map do |day|
      day[:summary]
    end

    all_gifs = daily_summary.map do |summary|
      gif_data = gif_service.get_gifs(summary)
      gif_url =  gif_data[:data][0][:url]

    end
  end


end
