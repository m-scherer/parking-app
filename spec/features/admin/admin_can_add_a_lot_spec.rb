require 'rails_helper'

describe 'As an Admin' do
  context 'When I visit /admin/lots/new' do
    it "can add a lot" do
      admin = stub_admin_user

      visit admin_new_lot_path

      fill_in :name, with: "Turing School"
      fill_in :address, with: "1510 Blake St Denver CO"
      fill_in :spots, with: 5

      expect(current_path).to eq(admin_lots_path)
      expect(page).to have_content("Turing School")
    end
  end
end
