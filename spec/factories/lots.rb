FactoryGirl.define do
  factory :lot do
    lat 39.733513
    long -104.965172
    name
  end
  sequence :name do |n|
    "Lot #{n}"
  end
end
