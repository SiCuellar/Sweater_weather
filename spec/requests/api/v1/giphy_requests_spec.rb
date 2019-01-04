require 'rails_helper'

describe 'Giphy request' do

  before(:each) do
    location = "denver,co"
    get "/api/v1/gifs?location=#{location}"
    # @parsed = JSON.parse(response.body, symbolize_names: true)
  end

  it 'sends a successful response' do
    expect(response).to be_successful
  end

  it 'returns a gif for each day' do
    # expect(response).to be_a(Hash)
    # expect(@parsed).to have_key(:daily)
    # expect(@parsed).to have_key(:time)
    # expect(@parsed).to have_key(:summary)
    # expect(@parsed).to have_key(:url)
  end
end
