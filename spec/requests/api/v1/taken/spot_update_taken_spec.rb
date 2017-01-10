require 'rails_helper'

describe 'Spot API' do
  context 'PUT' do
    let!(:spot) { create(:spot) }
    it 'can update a spot as taken' do
      VCR.use_cassette('.take_spot') do
        params = { image_url: 'http://www.toyoland.com/photos/lexus/ls/LS-460.jpg'}

        expect(spot.taken).to eq(false)

        put "/api/v1/taken/spots/#{spot.id}", params: params

        expect(response).to be_success
        expect(Spot.find(spot.id).taken).to eq(true)
      end
    end

    it 'a false flag remains false if no vehicle found' do
      VCR.use_cassette('.keep_spot_false') do
        params = { image_url: 'http://jewishcurrents.org/old-site/wp-content/uploads/2016/07/parking-spot.jpg' }

        expect(spot.taken).to eq(false)

        put "/api/v1/taken/spots/#{spot.id}", params: params

        expect(response).to be_success
        expect(Spot.find(spot.id).taken).to eq(false)
      end
    end

    it 'can update a spot as available' do
      VCR.use_cassette('.spot_available') do
        params = { image_url: 'http://jewishcurrents.org/old-site/wp-content/uploads/2016/07/parking-spot.jpg' }

        spot.update(taken: true)
        expect(spot.taken).to eq(true)

        put "/api/v1/taken/spots/#{spot.id}", params: params

        expect(response).to be_success
        expect(Spot.find(spot.id).taken).to eq(false)
      end
    end
  end
end
