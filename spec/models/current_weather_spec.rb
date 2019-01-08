require 'rails_helper'

RSpec.describe CurrentWeather, type: :model do
  it "it can return Hourly weather information " do
    weather_data = WeatherDataHelper.new("Denver, Co")
    # binding.pry
    daily_weather = weather_data.most_current_weather
    expect(daily_weather).to have_key(:data)
    expect(daily_weather).to be_a(Hash)
  end
end
