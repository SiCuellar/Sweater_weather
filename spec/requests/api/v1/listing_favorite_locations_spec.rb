require "rails_helper"

describe 'request' do
  it 'it returns a users favorites cities' do
    user_1 = User.create(email: 'whatever@example.com', password: 'password', api_key: 'ilikedogs')
    fav_city_1 =Favorite.create(location: 'denver, CO')
    fav_city_2 =Favorite.create(location: 'Los Angeles, CA')
    user_1.user_favorites.create(favorite_id: fav_city_1.id)
    user_1.user_favorites.create(favorite_id: fav_city_2.id)

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    get "/api/v1/favorites", :params => {
        "api_key": "ilikedogs",
       "controller"=>"api/v1/favorites",
       "action"=>"index",
       "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

    expect(request.params.keys).to include("api_key")

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(Favorite.last).to be_an_instance_of(Favorite)
    expect(Favorite.first).to be_an_instance_of(Favorite)
  end
end
