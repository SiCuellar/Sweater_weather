class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastSerializer.new(WeatherDataHelper.new(params[:location]))
  end
end
