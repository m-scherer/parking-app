require 'rails_helper'

describe GeocodeService do
  context 'when I pass in a location' do
    it 'returns a hash response' do
      VCR.use_cassette(".geocode") do
        address = "1510 Blake Street, Denver, CO"
        geocode = GeocodeService.new.find_lat_long(address)

        expect(geocode).to be_instance_of(Hash)
        expect(geocode).to have_key(:results)
      end
    end
  end
end
