class Lot < ApplicationRecord
  has_many :spots

  validates :name, presence: true

  attr_accessor :address

end
