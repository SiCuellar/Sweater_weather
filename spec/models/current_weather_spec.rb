require 'rails_helper'

RSpec.describe CurrentWeather, type: :model do
  VCR.use_cassette("current_weather_casette_1") do
    it "it can return Hourly weather information " do
      weather_data = WeatherDataHelper.new("Denver, Co")
      current_weather = weather_data.most_current_weather

      expect(current_weather).to be_an_instance_of(CurrentWeather)
    end
  end
end
