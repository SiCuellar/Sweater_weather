class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  set_id :user_id
  attributes :body
end
