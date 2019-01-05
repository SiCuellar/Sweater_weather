require "rails_helper"

describe "user login" do
  it 'user login requset returns a user specific key' do
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/sessions", :params => {
      "email": "whatever@example.com",
      "password": "password",
      "controller"=>"api/v1/sessions",
      "action"=>"create",
      "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

    expect(request.params.keys).to include("user")
    expect(request.params.keys).to include("email")
    expect(request.params.keys).to include("password")


  end

end
