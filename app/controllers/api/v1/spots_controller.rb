class Api::V1::SpotsController < ApplicationController

  def update
    classifiers = ImageClassifier.create_classifiers(get_image_url)
    classifiers.each do |classifier|
      if classifier.classification == 'vehicle' && classifier.score > 0.75
        return find_spot.update!(taken: true)
      else
        find_spot.update(taken: false)
      end
    end
  end

  private

  def get_image_url
    params.permit(:image_url)[:image_url]
  end

  def find_spot
    Spot.find(params.permit(:id)[:id])
  end

end
