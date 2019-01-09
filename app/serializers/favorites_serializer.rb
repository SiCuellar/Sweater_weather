class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  set_id :user
  attributes :location, :most_current_weather
end
