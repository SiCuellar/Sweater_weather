require "rails_helper"

describe 'request' do
  it 'exists' do
    user = User.create(email: 'whatever@example.com', password: 'password', api_key: 'ilikedogs')

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/favorites", :params => {"location": "Denver, CO",
        "api_key": "ilikedogs",
       "controller"=>"api/v1/favorites",
       "action"=>"create",
       "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

    expect(request.params.keys).to include("location")
    expect(request.params.keys).to include("api_key")

    expect(response).to be_successful

    expect(Favorite.last).to be_an_instance_of(Favorite)
  end

  it 'returns failing status code when incorrect api key' do
    user = User.create(email: 'whatever@example.com', password: 'password', api_key: 'pigs')

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/favorites", :params => {"location": "Denver, CO",
        "api_key": "ilikedogs",
       "controller"=>"api/v1/favorites",
       "action"=>"create",
       "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

    expect(response.status).to eq(401)
  end
end
