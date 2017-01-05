FactoryGirl.define do
  factory :spot do
    taken false
    lot
    number
  end
  sequence :number do |n|
    n
  end
end
