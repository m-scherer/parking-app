require 'rails_helper'

RSpec.describe Lot, type: :model do
  context 'relationships' do
    it { should have_many(:spots) }
  end

  context do
    it { should validate_presence_of(:name) }
  end

  context '#create_spots' do
    it "creates spots when a lot is created" do
      lot = create(:lot)
      spots = 5
      lot.create_spots(spots)

      expect(lot.spots.count).to eq(5)
    end
  end

  context '#update_spots' do
    it "can update the spots asscoiated with a lot" do
      lot = create(:lot)
      spots = 5
      lot.create_spots(spots)
      updated_spots = 4
      lot.update_spots(updated_spots)

      expect(lot.spots.count).to eq(4)
    end
  end

end
