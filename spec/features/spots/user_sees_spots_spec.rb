require 'rails_helper'

describe 'As a User' do
  context 'When I am looking for a spot' do
    let!(:spot) { create(:spot) }
    it 'I see spots on the page' do

      visit spots_path

      expect(page).to have_content(spot.lot.name)
      expect(page).to have_content(spot.number)
      expect(page).to have_content('Available')
    end
  end
end
