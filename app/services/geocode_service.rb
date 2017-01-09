class GeocodeService

  def find_coordinates(address)
    response = conn.get( '/maps/api/geocode/json', { address: address } )
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:key] = ENV['GOOGLE_GEOCODE_KEY']
    end
  end

end
