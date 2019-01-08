class Api::V1::ForecastController < ApplicationController
  def show
    weather_helper = WeatherDataHelper.new(params[:location])
    weather = weather_helper.weather_data
    gif_helper = GiphyDataHelper.new
    render json: weather
  end
end
