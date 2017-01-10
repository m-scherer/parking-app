class Lot < ApplicationRecord
  has_many :spots

  validates :name, presence: true

  attr_accessor :address

  def create_spots(spots)
    spots.times do |i|
      self.spots.create(number: i+1)
    end
  end

end
