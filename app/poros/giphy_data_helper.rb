require 'rails_helper'

class GiphyDataHelper
  def initialize(weather_data)
    @weather_data = weather_data
    @gif_service = GiphyService.new
  end

  def get_summary
    @weather_data[:daily][:data]
    binding.pry

  end



end
