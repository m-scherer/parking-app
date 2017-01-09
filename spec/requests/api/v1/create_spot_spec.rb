require 'rails_helper'

describe 'Spot API' do
  let!(:lot) { create(:lot) }
  context 'POST' do
    it 'can create a spot' do
      VCR.use_cassette('.create_spot') do
        params = { lot_id: lot.id, number: 1 }

        expect(Spot.count).to eq(0)

        post '/api/v1/spots', params: params
        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_success
        expect(Spot.count).to eq(1)
        expect(parsed).to be_instance_of(Hash)
        expect(parsed[:lot_id]).to eq(lot.id)
      end
    end
    it "won't create a spot without a lot" do
      VCR.use_cassette('.no_create_spot') do
        params = { number: 1 }

        post '/api/v1/spots', params: params

        expect(response.status).to eq(406)
        expect(Spot.count).to eq(0)
      end
    end
    it "won't create a spot without a number" do
      VCR.use_cassette('.bad_spot_number') do
        params = { lot_id: lot.id }

        post '/api/v1/spots', params: params

        expect(response.status).to eq(406)
        expect(Spot.count).to eq(0)
      end
    end
  end
end
