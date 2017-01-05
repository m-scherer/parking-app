class Spot < ApplicationRecord
  belongs_to :lot
  validates :number, presence: true
end
