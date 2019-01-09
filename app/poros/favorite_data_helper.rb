require 'rails_helper'

class FavoriteDataHelper
  attr_reader :user_id

  def initialize(user)
    @user_id = user.id
    @user = user
    @favs = user.favorites
    @google_data = GoogleMapsService.new
    @darkskyservice = DarkskyService.new
  end

  def body
   data = {}
    location = @favs.map do |fav|
     loc = {location: fav.location}
     data.merge!(loc)
     coordinates = @google_data.get_coordinates(fav.location)
     weather = @darkskyservice.get_forcast(coordinates[:lat],coordinates[:lng])[:currently]
     current = {current_weather: weather}
     data.merge!(current)
    end
  end
end
