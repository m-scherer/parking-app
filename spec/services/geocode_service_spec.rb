require 'rails_helper'

describe GeocodeService do
  context '#find_coordinates' do
    it 'returns a hash response' do
      VCR.use_cassette(".geocode") do
        address = "1510 Blake Street, Denver, CO"
        geocode = GeocodeService.new.find_coordinates(address)

        expect(geocode).to be_instance_of(Hash)
        expect(geocode).to have_key(:results)
      end
    end
  end
end
