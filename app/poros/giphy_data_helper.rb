require 'rails_helper'

class GiphyDataHelper
  def initialize(weather_data)
    @weather_data = weather_data
    @gif_service = GiphyService.new
  end

  def get_summary
    days = @weather_data[:daily][:data]
    summaries = days.map do |day|
      gif_info = @gif_service.get_gifs(day[:summary])
      gif_info[:data][0][:url]
    end
  end
end
