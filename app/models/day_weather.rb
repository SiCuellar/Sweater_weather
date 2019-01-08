class DayWeather
  attr_reader :time,
              :summary,
              :icon,
              :precip,
              :temp_high,
              :temp_low,
              :visibility

  def initialize(day_weater_data)
    # binding.pry
    @time = day_weather_data[:time]
    @summary = day_weather_data[:summary]
    @icon = day_weather_data[:icon]
    @precip = day_weather_data[:precipProbability]
    @temp_high = day_weather_data[:temperatureHigh]
    @temp_low = day_weather_data[:temperatureLow]
    @visibility = day_weather_data[:visibility]
  end
end
