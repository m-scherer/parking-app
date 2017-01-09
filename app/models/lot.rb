class Lot < ApplicationRecord
  has_many :spots

  validates :name, presence: true

end
