require 'rails_helper'

RSpec.describe DayWeather, type: :model do
    it "it can return weather information for a day " do
      weather = {:time=>1546930800,
                :summary=>"Partly cloudy in the morning.",
                :icon=>"partly-cloudy-day",
                :precipProbability=>0.01,
                :temperatureHigh=>45.4,
                :temperatureLow=>27.71,
                :visibility=>10}

      subject = DayWeather.new(weather)

      expect(subject).to be_an_instance_of(DayWeather)
      expect(subject.time).to be_an_instance_of(Integer)
      expect(subject.summary).to be_an_instance_of(String)
      expect(subject.icon).to eq("partly-cloudy-day")
      expect(subject.precip).to be_an_instance_of(Float)
      expect(subject.temp_high).to be_an_instance_of(Float)
      expect(subject.temp_low).to be_an_instance_of(Float)
    end
end
