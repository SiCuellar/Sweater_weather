class Api::V1::ForecastController < ApplicationController
  def show
    weather_helper = WeatherDataHelper.new(params[:location])
    weather = weather_helper.weather_data

    # binding.pry
    render json: weather
    # render json: ForecastSerializer.new(Forecast.all)
  end
end

# weather = weather_helper.daily_weather
# gif_helper = GiphyDataHelper.new(weather)
# gif_helper.get_daily_summary
