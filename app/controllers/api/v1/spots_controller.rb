class Api::V1::SpotsController < ApplicationController

  def update
    classifiers = ImageClassifier.create_classifiers(get_image_url)
    ImageClassifier.change_taken_flag(classifiers)
  end

  private

  def get_image_url
    params.permit(:image_url)[:image_url]
  end

  def find_spot
    Spot.find(params.permit(:id)[:id])
  end

end
