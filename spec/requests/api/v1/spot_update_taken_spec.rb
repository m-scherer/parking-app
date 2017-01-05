require 'rails_helper'

describe 'Spot API' do
  context 'PUT' do
    let!(:spot) { create(:spot) }
    it 'can update a spot as taken' do
      params = { image_url: 'http://www.toyoland.com/photos/lexus/ls/LS-460.jpg' }

      expect(spot.taken).to eq(false)

      put "/api/v1/spots/#{spot.id}", params: params

      expect(response).to be_success
      expect(spot.taken).to eq(true)
    end
    xit 'can update a spot as available' do
      params = { image_url: 'http://jewishcurrents.org/old-site/wp-content/uploads/2016/07/parking-spot.jpg' }

      expect(spot.taken).to eq(true)

      put "/api/v1/spots/#{spot.id}", params: params

      expect(response).to be_success
      expect(spot.taken).to eq(false)
    end
  end
end
