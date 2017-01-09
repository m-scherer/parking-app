require 'rails_helper'

describe 'As a User' do
  let!(:spots) { create_list(:spot, 2) }
  context 'When a spot is taken' do
    it 'is labeled as taken' do
      spot = Spot.first
      spot.update(taken: true)

      visit spots_path

      expect(page).to have_content('Taken')
    end
  end
  context 'When a spot is available' do
    it 'is labeled as available' do
      spot = Spot.first

      visit spots_path

      expect(page).to have_content('Available')
    end
  end
end
