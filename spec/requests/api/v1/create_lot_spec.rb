require 'rails_helper'

describe 'Lot API' do
  let!(:lot) { Lot.new(lat: 39.733513, long: -104.965172, name: "Big Lot") }
  context 'POST' do
    it 'can create lots' do
      VCR.use_cassette('.create_lot') do
        params = { lat: lot.lat, long: lot.long, name: lot.name }

        expect(Spot.count).to eq(0)

        post '/api/v1/lots', params: params
        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_success
        expect(Lot.count).to eq(1)
        expect(parsed).to be_instance_of(Hash)
        expect(parsed[:lat]).to eq(lot.lat)
        expect(parsed[:long]).to eq(lot.long)
        expect(parsed[:name]).to eq(lot.name)
      end
    end
    it "won't create a lot without a name" do
      VCR.use_cassette('.bad_lot_name') do
        params = { lat: lot.lat, long: lot.long }

        post '/api/v1/spots', params: params

        expect(response.status).to eq(406)
        expect(Lot.count).to eq(0)
      end
    end
  end
end
