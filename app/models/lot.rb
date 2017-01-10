class Lot < ApplicationRecord
  has_many :spots

  validates :name, presence: true

  attr_accessor :address

  def create_spots(spots)
    spots.times do |i|
      self.spots.create(number: i+1)
    end
  end

  def update_spots(spots)
    if spots
      self.spots.destroy_all
      create_spots(spots)
    else
      return
    end
  end

end
