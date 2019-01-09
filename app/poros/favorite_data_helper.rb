require 'rails_helper'

class FavoriteDataHelper
  attr_reader :user_id

   def initialize(user)
     binding.pry
     @user_id = user.id
     @user = user
     @favorites = user.favorites
     # @weather_adapter = WeatherAdapter.new
     # @coordinate_adapter = CoordinatesAdapter.new

     @google_data = GoogleMapsService.new
     # coordinates = google_data.get_coordinates(location)
     @darkskyservice = DarkskyService.new
     # @weather_data = darkskyservice.get_forcast(coordinates[:lat], coordinates[:lng])
   end

   def body
     data = {}
     location = @favorites.map do |fav|
       loc = {location: fav.location}
       data.merge!(loc)

       coordinates = @google_data.get_coordinates(fav.location)
       # coords = @coordinate_adapter.build(fav.location)

       weather = @darkskyservice.get_forcast(coordinates)[:currently]
       # weather = @weather_adapter.build(coords)[:currently]

       cur = {current_weather: weather}
       data.merge!(cur)
     end
   end

 end
