class GoogleMapsService

  def initialize(location)
    @location = location
  end

  def find_coordinates
    get_json("/maps/api/geocode/json?address=#{@location}/key=ENV["GOOGLE_MAPS_KEY"]")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)#[:results]
  end

  def conn
    @conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.headers["X-API-Key"] = ENV["GOOGLE_MAPS_KEY"]
      faraday.adapter  Faraday.default_adapter
    end
  end
end
