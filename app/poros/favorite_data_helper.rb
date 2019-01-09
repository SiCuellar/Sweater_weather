require 'rails_helper'

class FavoriteDataHelper
  attr_reader :user
  def initialize(user)
    binding.pry
    @user = user
    new = WeatherDataHelper()
    # google_data = GoogleMapsService.new
    # coordinates = google_data.get_coordinates(location)
    # darkskyservice = DarkskyService.new
    # @weather_data = darkskyservice.get_forcast(coordinates[:lat], coordinates[:lng])
  end

  def user_favorites
    @user.favorites
  end

end
