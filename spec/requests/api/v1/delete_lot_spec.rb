require 'rails_helper'

describe 'Lot API' do
  let!(:lot) { create(:lot) }
  context 'DELETE' do
    it "can delete a lot" do
      VCR.use_cassette('.delete_lot') do

        delete "/api/v1/lots/#{lot.id}"

        expect(response.status).to eq(204)
        expect(Lot.count).to eq(0)
      end
    end
  end
end
