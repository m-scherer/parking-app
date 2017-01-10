require 'rails_helper'

describe 'Lot API' do
  let!(:lot) { create(:lot) }
  context 'GET' do
    it "can return a lot" do
      get "/api/v1/lots/#{lot.id}"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(parsed).to be_instance_of(Hash)
      expect(parsed[:name]).to eq(lot.name)
      expect(parsed[:lat]).to eq(lot.lat)
      expect(parsed[:long]).to eq(lot.long)
    end
  end
end
