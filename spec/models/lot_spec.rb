require 'rails_helper'

RSpec.describe Lot, type: :model do
  context 'relationships' do
    it { should have_many(:spots) }
  end

  context do
    it { should validate_presence_of(:name) }
  end
end
