require 'rails_helper'

RSpec.feature "user logs out" do
  scenario 'user can log out' do
    stub_omniauth

    visit root_path
    click_link "Sign in with Google"
    visit root_path
    click_on "Logout"

    expect(page).to have_content('Sign in with Google')
  end
end
