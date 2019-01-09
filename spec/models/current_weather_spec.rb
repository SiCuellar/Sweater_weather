require 'rails_helper'

RSpec.describe CurrentWeather, type: :model do
  VCR.use_cassette("current_weather_casette") do
    it "it can return Hourly weather information " do
      weather_data = WeatherDataHelper.new("Denver, Co")
      current_weather = weather_data.most_current_weather

      expect(current_weather).to be_an_instance_of(CurrentWeather)
      expect(current_weather.visibility).to be_an_instance_of(Float)
      expect(current_weather.temp).to be_an_instance_of(Float)
    end
  end
end
