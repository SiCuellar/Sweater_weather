class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  set_id :user
  attributes :body
end
