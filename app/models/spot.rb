class Spot < ApplicationRecord
  belongs_to :lot

  validates :taken?, presence: true
end
