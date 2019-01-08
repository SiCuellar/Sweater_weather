class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user
        fav_data = user.favorites.map do |fav|
          weather_helper = WeatherDataHelper.new(fav[:location])
          data = Hash.new
          current_weather = {current_weather: weather_helper.current_weather}
          location = {location: fav[:location]}
          data.merge!(location)
          data.merge!(current_weather)
          data
        end
      render json: fav_data, status: 200

    else
      render :status => 401
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      fav_location = Favorite.find_or_create_by(location: params[:location].split.join.downcase)
      user.user_favorites.create(favorite_id: fav_location.id)
      render json: "Good Job", status: 204
    else
      render :status => 401
    end
  end
end
