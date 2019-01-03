class Api::V1::ForecastController < ApplicationController
  def show
    @location = GoogleMapsService.new(params[:location])
  end
end
