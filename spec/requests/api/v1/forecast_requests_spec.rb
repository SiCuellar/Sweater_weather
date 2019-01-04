require "rails_helper"

describe 'request' do

  before(:each) do
    location = "denver,co"
    get "/api/v1/forecast?location=#{location}"
  end

  it 'sends a successful response' do
    expect(response).to be_successful
  end

  xit 'sends successful daily forecast' do
    binding.pry
    expect(response).to be_a(Hash)
    # expect(response).to have_key(:currently)
    # expect(response).to have_key(:hourly)
    # expect(response).to have_key(:daily)
  end



end
