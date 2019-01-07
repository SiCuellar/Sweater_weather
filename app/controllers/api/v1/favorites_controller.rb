class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      fav_location = Favorite.find_or_create_by(location: params[:location])
      user.user_favorites.create(favorite_id: fav_location.id)
      render json: "Good Job", status: 204
    else
      render :status => 404
    end
  end
end
