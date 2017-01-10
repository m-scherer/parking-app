class Spot < ApplicationRecord
  belongs_to :lot
  validates :number, presence: true

  def set_taken_flag(classifiers)
    if ImageClassifier.find_vehicle_classification(classifiers)
       update!(taken: true)
     else
       update!(taken: false)
    end
  end

end
