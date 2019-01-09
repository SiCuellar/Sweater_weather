class CurrentWeather
  attr_reader :time,
              :summary,
              :precip,
              :temp,
              :humidity,
              :uv_index,
              :visibility

  def initialize(weather_data)
    @time = weather_data[:currently][:time]
    @summary = weather_data[:currently][:summary]
    @precipertation = weather_data[:currently][:precipProbability]
    @temp = weather_data[:currently][:temperature]
    @temp_feel_like = weather_data[:currently][:apparentTemperature]
    @humidity = weather_data[:currently][:humidity]
    @uv_index = weather_data[:currently][:uvIndex]
    @visibility = weather_data[:currently][:visibility]
  end
end
