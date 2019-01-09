class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoritesSerializer.new(FavoriteDataHelper.new(user))
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

  def destroy
    user = User.find_by(api_key: params[:api_key])
    if user
      unfav = user.favorites.find_by(location: params[:location])
      unfav.destroy
      render json: "Good Job", status: 204
    else
      render :status => 401
    end
  end
end
