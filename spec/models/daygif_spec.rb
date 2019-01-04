require 'rails_helper'

RSpec.describe Daygif, type: :model do

  before(:each) do
    location = "denver,co"
    @gifday_data = Daygif.new(location)
  end

  it 'exist' do
    expect(@gifday_data).to be_an_instance_of(Daygif)
  end

  it "can return a coordinates" do
    location = "denver,co"
    coordinates = @gifday_data.get_coords

    expect(coordinates).to eq({:lat=>39.7392358, :lng=>-104.990251})
  end

  it "can return a weather data " do
    location = "denver,co"
    weather_data = @gifday_data.get_weather_data

    expect(weather_data).to be_a(Hash)
    expect(weather_data).to have_key(:currently)
    expect(weather_data).to have_key(:hourly)
    expect(weather_data).to have_key(:daily)
  end

end
