require 'rails_helper'

RSpec.describe Spot, type: :model do
  context 'relationships' do
    it { should belong_to(:lot) }
  end
end
