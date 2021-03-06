require "rails_helper"

describe 'request' do

  before(:each) do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_MAPS_KEY']}")
    .to_return(body: File.read("./spec/fixtures/google_map.json"))

    stub_request(:get, "https://api.darksky.new/forecast/#{ENV['DARK_SKY_KEY']}/39.7392358,-104.990251")
    .to_return(body: File.read("./spec/fixtures/darksky_map.json"))

    location = "denver,co"
    VCR.use_cassette("giphy_casette_fix") do
      get "/api/v1/forecast?location=#{location}"
    end
    @parsed = JSON.parse(response.body, symbolize_names: true)
  end

  it 'sends a successful response' do
    expect(response).to be_successful
  end

  it 'sends successful daily forecast' do
    expect(@parsed).to be_a(Hash)
    expect(@parsed[:data][:attributes]).to have_key(:daily_weather)
    expect(@parsed[:data][:attributes][:daily_weather][0]).to have_key(:time)
    expect(@parsed[:data][:attributes][:daily_weather][0]).to have_key(:summary)
    expect(@parsed[:data][:attributes][:daily_weather][0]).to have_key(:icon)
    expect(@parsed[:data][:attributes][:daily_weather][0]).to have_key(:gif_url)
  end

  it 'sends successful hourly forecast' do
    expect(@parsed).to be_a(Hash)
    expect(@parsed[:data][:attributes]).to have_key(:daily_weather)
    expect(@parsed[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(@parsed[:data][:attributes][:hourly_weather][0]).to have_key(:summary)
    expect(@parsed[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
  end
end
