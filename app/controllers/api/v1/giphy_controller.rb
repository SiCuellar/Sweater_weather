class Api::V1::GiphyController < ApplicationController
  def index
    data_set = Daygif.new(params[:location])
    # binding.pry
    # render json: data_set
  end
end
