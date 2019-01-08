class Api::V1::ForecastController < ApplicationController
  def show
    weather_helper = WeatherDataHelper.new(params[:location])
    weather = weather_helper.weather_data
    render json: weather
  end
end
