require 'rails_helper'

describe 'As a User' do
  let!(:spots) { create_list(:spot, 2) }
  context 'When a spot is taken' do
    it 'is labeled as taken' do
      visit spots_path
      spot = Spot.first.update(taken: true)

      expect(page).to have_content(taken)
    end
  end
end
