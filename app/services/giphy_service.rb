class GiphyService

  def get_gifs(summary)
    get_json("/v1/gifs/search?q=#{summary}&api_key=#{ENV["GIPHY_KEY"]}&limit=1")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @conn = Faraday.new(url: "http://api.giphy.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
