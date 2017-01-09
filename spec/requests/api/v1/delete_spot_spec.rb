require 'rails_helper'

describe 'Spot API' do
  let!(:spot) { create(:spot) }
  context 'DELETE' do
    it "can delete a spot" do
      VCR.use_cassette('.delete_spot') do

        delete "/api/v1/spots/#{spot.id}"

        expect(response.status).to eq(204)
        expect(Spot.count).to eq(0)
      end
    end
  end
end
