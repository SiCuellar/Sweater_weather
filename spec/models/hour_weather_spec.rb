require 'rails_helper'

RSpec.describe HourWeather, type: :model do
    it "it can return weather information for a day " do
      hour_weather = {:time=>1546988400,
                 :summary=>"Clear",
                 :icon=>"clear-day",
                 :precipProbability=>0,
                 :temperature=>43.74}

      subject = HourWeather.new(hour_weather)

      expect(subject).to be_an_instance_of(HourWeather)
      expect(subject.time).to be_an_instance_of(Integer)
      expect(subject.summary).to be_an_instance_of(String)
      expect(subject.icon).to be_an_instance_of(String)
      expect(subject.precip).to eq(0)
      expect(subject.temp).to be_an_instance_of(Float)
    end
end
