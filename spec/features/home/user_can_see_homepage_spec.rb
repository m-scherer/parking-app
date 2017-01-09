require 'rails_helper'

describe 'As a User' do
  context 'root path' do
    it 'shows the homepage' do
      visit root_path

      expect(page).to have_content("Welcome")
    end
  end
end
