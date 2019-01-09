class GiphyService

  def get_gif_url(summary)
    get_json("/v1/gifs/search?q=#{summary}&api_key=#{ENV["GIPHY_KEY"]}&limit=1")[:data][0][:embed_url]
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
