require "rails_helper"

describe 'request' do
  it 'exists' do
    user = User.create(email: 'whatever@example.com', password: 'password', api_key: 'ilikedogs')

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    get "/api/v1/favorites", :params => {
        "api_key": "ilikedogs",
       "controller"=>"api/v1/favorites",
       "action"=>"index",
       "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

    expect(request.params.keys).to include("api_key")

    expect(response).to be_successful

    expect(Favorite.last).to be_an_instance_of(Favorite)
    expect(Favorite.first).to be_an_instance_of(Favorite)
  end
end
