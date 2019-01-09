class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  set_id :user
  attributes :location, :current_weather
end
