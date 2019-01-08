require 'rails_helper'

describe GiphyService do
  it " Gets JSON data" do
    VCR.use_cassette("Giphy_casette") do
      service = GiphyService.new
      summary = "Clear_throughout_the_day"
      gif_data = service.get_gifs(summary)
      # binding.pry
      expect(service).to be_an_instance_of(GiphyService)

      expect(gif_data).to be_a(Hash)
      expect(gif_data).to have_key(:data)
      expect(gif_data[:data]).to be_a(Array)
      expect(gif_data[:data].first).to have_key(:type)
    end
  end
end
