require 'rails_helper'

RSpec.describe Lot, type: :model do
  context 'relationships' do
    it { should have_many(:spots) }
  end
end
