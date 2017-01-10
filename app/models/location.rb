class Location
  attr_reader :lat, :long

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def self.create_location(address)
    service = GeocodeService.new.find_coordinates(address)
    Location.new(
      service[:results].first[:geometry][:location][:lat],
      service[:results].first[:geometry][:location][:long]
    )
  end

end
