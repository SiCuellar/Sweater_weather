require 'rails_helper'

describe GiphyService do
  it " Gets JSON data" do
    VCR.use_cassette("Giphy_casette") do
      service = GiphyService.new
      summary = "Clear_throughout_the_day"
      gif_data = service.get_gif_url(summary)

      expect(service).to be_an_instance_of(GiphyService)

      expect(gif_data).to be_a(String)
      expect(gif_data).to include("https://giphy.com")
    end
  end
end
