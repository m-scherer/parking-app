require 'rails_helper'

describe 'Spot API' do
  let!(:lot) { create(:lot) }
  let!(:new_lot) { Lot.new(lat: 39.733513, long: -104.965172, name: "Big Lot") }
  context 'PUT' do
    it "updates a lot" do
      VCR.use_cassette('.update_lot') do
        params = { lat: new_lot.lat, long: new_lot.long, name: new_lot.name }

        put "/api/v1/lots/#{lot.id}", params: params

        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_success
        expect(parsed[:name]).to eq(new_lot.name)
        expect(parsed[:lat]).to eq(new_lot.lat)
        expect(parsed[:long]).to eq(new_lot.long)
      end
    end
  end
end
