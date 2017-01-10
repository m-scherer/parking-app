require 'rails_helper'

describe Location do
  context '#create_locations' do
    it "can create locations" do
      VCR.use_cassette('.create_locations') do
        address = '1510 Blake St Denver CO'
        location = Location.create_location(address)

        expect(location).to be_instance_of(Location)
        expect(location).to respond_to(:long)
        expect(location).to respond_to(:lat)
      end
    end
  end
end
