require 'rails_helper'

describe 'Spot API' do
  let!(:lot) { create(:lot) }
  let!(:spots) { create_list(:spot, 2, lot: lot) }
  context 'GET' do
    it "can return all spots and their lot" do
      params = { lots: true }
      get '/api/v1/spots', params: params

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(parsed).to be_instance_of(Array)
      expect(parsed.count).to eq(2)
      expect(parsed.first).to be_instance_of(Hash)
      expect(parsed.first).to have_key(:lot_id)
      expect(parsed.first).to have_key(:number)
      expect(parsed.first).to have_key(:taken)
    end
  end
end
