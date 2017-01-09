require 'rails_helper'

RSpec.describe Spot, type: :model do
  context 'relationships' do
    it { should belong_to(:lot) }
  end

  context 'validations' do
    it { should validate_presence_of(:number) }
  end
end
