require 'rails_helper'

RSpec.feature "user logs in" do
  scenario 'using google oauth2' do
    stub_omniauth

    visit root_path
    click_link "Sign in with Google"

    expect(page).to have_content('scmi2nd@gmail.com')
    expect(page).to have_content('Logout')
  end
end
