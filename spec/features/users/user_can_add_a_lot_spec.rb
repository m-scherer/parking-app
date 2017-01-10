require 'rails_helper'

describe 'As a User' do
  context 'When I visit /lots/new' do
    it "can add a lot" do
      VCR.use_cassette(".add_a_lot") do
        auth = {
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
        }

        User.update_or_create(auth)
        user = User.first

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit new_lot_path

        fill_in 'lot[name]', with: "Turing School"
        fill_in 'lot[address]', with: "1510 Blake St Denver CO"
        fill_in 'lot[spots]', with: 5
        click_on 'Create Lot'

        lot = Lot.find_by(name: "Turing School")

        expect(current_path).to eq(lots_path)
        expect(page).to have_content("Turing School successfully created")
        expect(lot.lat).to eq(39.7496354)
        expect(lot.long).to eq(-105.0001058)
      end
    end
  end
end
