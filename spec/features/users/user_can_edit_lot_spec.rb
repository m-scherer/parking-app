require 'rails_helper'

describe "As a user" do
  let!(:auth) { {
    provider: "google",
    uid: "12345678910",
    info: {
      email: "scmi2nd@gmail.com",
      first_name: "Michael",
      last_name: "Scherer"
    },
    credentials: {
      token: "abcdefg12345",
      refresh_token: "12345abcdefg",
      expires_at: DateTime.now
    }
    } }
    let!(:lot) { create(:lot) }
    let!(:spots) { create_list(:spot, 2, lot: lot) }
  context 'When I edit a lot' do
    it 'edits the lot' do
      VCR.use_cassette('.edit_lot') do
        User.update_or_create(auth)
        user = User.first
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        new_spots = lot.spots.count - 1
        visit edit_lot_path(lot)
        fill_in 'lot[name]', with: "Changed"
        fill_in 'lot[spots]', with: new_spots
        click_on 'Update Lot'

        expect(current_path).to eq(spots_path)
        expect(page).to have_content("Changed successfully updated")
        expect(page).to have_content("Changed")
        expect(page).to have_selector('#spot', count: new_spots)
      end
    end
  end
end
