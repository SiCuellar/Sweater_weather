require "rails_helper"

describe 'request' do
  it 'it removes a city from users favorites' do
    user_1 = User.create(email: 'whatever@example.com', password: 'password', api_key: 'ilikedogs')
    fav_city_1 =Favorite.create(location: 'Denver, CO')
    fav_city_2 =Favorite.create(location: 'Los Angeles, CA')
    user_1.user_favorites.create(favorite_id: fav_city_1.id)
    user_1.user_favorites.create(favorite_id: fav_city_2.id)

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    delete "/api/v1/favorites", :params => {
      "location": "Denver, CO",
        "api_key": "ilikedogs",
       "controller"=>"api/v1/favorites",
       "action"=>"destroy"}, :headers => headers

    expect(request.params.keys).to include("api_key")
    expect(request.params.keys).to include("location")

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(Favorite.count).to eq(1)
  end

  it 'it returns an error when its the wrong api_key' do
    user_1 = User.create(email: 'whatever@example.com', password: 'password', api_key: 'ilikedogs')
    fav_city_1 =Favorite.create(location: 'Denver, CO')
    fav_city_2 =Favorite.create(location: 'Los Angeles, CA')
    user_1.user_favorites.create(favorite_id: fav_city_1.id)
    user_1.user_favorites.create(favorite_id: fav_city_2.id)

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    delete "/api/v1/favorites", :params => {
      "location": "Denver, CO",
        "api_key": "pigscanfly",
       "controller"=>"api/v1/favorites",
       "action"=>"destroy"}, :headers => headers

    expect(request.params.keys).to include("api_key")
    expect(request.params.keys).to include("location")

    expect(response.status).to eq(401)
    expect(Favorite.count).to eq(2)
  end
end
