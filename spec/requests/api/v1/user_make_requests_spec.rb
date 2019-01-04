require 'rails_helper'

describe 'user request' do


  it 'posts a new user' do
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/users", :params => { "user": {"email"=>"whatever@example.com",
                  "password"=>"password",
                  "password_confirmation"=>"password"}}, :headers => headers

    expect(response).to be_successful
    expect(response).to eq({"api_key": "jgn983hy48thw9begh98h4539h4",})
  end

end
