class Api::V1::ForecastController < ApplicationController
  def show
    # binding.pry
    @location = GoogleMapsService.new(params[:location])
  end
end
