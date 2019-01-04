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

  it "can return a gif Url based on summary " do
    location = "denver,co"
    gif_url = @gifday_data.get_current_day_gif_url

    expect(gif_url).to be_a(String)
    expect(gif_url).to eq("https://giphy.com/gifs/pretty-sky-gorgeous-alEGxmahCCywE")
  end

  it "can return a all summary for days gif Url" do
    gif_url = @gifday_data.get_summary_all_days

    expect(gif_url).to be_a(Array)
  end

  # it "can return a time for each day" do
  #   day_times = @gifday_data.get_days
  #
  #   expect(gif_url).to be_a(Array)
  # end
end
