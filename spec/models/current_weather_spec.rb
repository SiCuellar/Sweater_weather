require 'rails_helper'

RSpec.describe CurrentWeather, type: :model do
  VCR.use_cassette("current_weather_casette") do
    it "it can return Hourly weather information " do
      weather_data = WeatherDataHelper.new("Denver, Co")
      current_weather = weather_data.most_current_weather

      expect(current_weather).to be_an_instance_of(CurrentWeather)
      expect(current_weather.visibility).to be_a(Integer)
      expect(current_weather.summary).to eq("Clear")
      expect(current_weather.precipertation).to eq(0)
      expect(current_weather.temp).to be_a(Float)
      expect(current_weather.humidity).to eq(0.28)
      expect(current_weather.uv_index).to eq(1)
      expect(current_weather.visibility).to eq(10)
    end
  end
end
