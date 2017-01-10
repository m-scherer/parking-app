require 'rails_helper'

describe 'Lot API' do
  let!(:lots) { create_list(:lot, 2) }
  context 'GET' do
    it "can return all lots" do
      get "/api/v1/lots"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(parsed).to be_instance_of(Array)
      expect(parsed.count).to eq(2)
      expect(parsed.first).to be_instance_of(Hash)
      expect(parsed.first).to have_key(:name)
      expect(parsed.first).to have_key(:lat)
      expect(parsed.first).to have_key(:long)
    end
  end
end
