class GeocodeService

  def find_lat_long(address)
    response = conn.get "maps/api/geocode/json?address=#{address}&key=#{ENV['GOOGLE_GEOCODE_KEY']}"
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
    faraday.request  :url_encoded
    faraday.response :logger
    faraday.adapter  Faraday.default_adapter
    end
  end

end
