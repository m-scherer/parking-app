require 'rails_helper'

describe 'Spot API' do
  let!(:spot) { create(:spot) }
  context 'GET' do
    it "can return a spot" do
      get "/api/v1/spots/#{spot.id}"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(parsed).to be_instance_of(Hash)
      expect(parsed).to have_key(:lot_id)
      expect(parsed).to have_key(:number)
      expect(parsed).to have_key(:taken)
    end
  end
end
