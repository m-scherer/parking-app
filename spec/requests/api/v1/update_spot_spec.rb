require 'rails_helper'

describe 'Spot API' do
  let!(:spot) { create(:spot) }
  let!(:lot) { create(:lot) }
  context 'PUT' do
    it "updates a spot" do
      VCR.use_cassette('.update_spot') do
        params = { lot_id: lot.id, number: 2, taken: true }
        expect(spot.lot_id).to eq(spot.lot.id)

        put "/api/v1/spots/#{spot.id}", params: params

        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_success
        expect(parsed[:lot_id]).to eq(lot.id)
        expect(parsed[:taken]).to eq(params[:taken])
      end
    end
    it "raises an error if it can't update" do
      VCR.use_cassette('.bad_lot_spot_update') do
        params = { lot_id: 99, number: 2, taken: true }

        put "/api/v1/spots/#{spot.id}", params: params

        find_spot = Spot.find(spot.id)

        expect(response.status).to eq(406)
        expect(find_spot.lot_id).to_not eq(params[:lot_id])
        expect(find_spot.taken).to_not eq(params[:taken])
      end
    end
  end
end
