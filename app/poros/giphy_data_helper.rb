class GiphyDataHelper
  def get_summary(summary)
    service = GiphyService.new
    url = service.get_gif_url(summary)
  end
end
