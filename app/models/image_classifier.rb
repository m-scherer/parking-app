class ImageClassifier
  attr_reader :classification, :score

  def initialize(classification, score)
    @classification = classification
    @score = score
  end

  def self.create_classifiers(url)
    classifiers = ImageService.new.analyze_image(url)[:images].first[:classifiers].first[:classes]
    classifiers.map do |classifier|
      ImageClassifier.new(
        classifier[:class],
        classifier[:score]
      )
    end
  end

  def self.change_taken_flag(classifiers)
    classifiers.each do |classifier|
      if classifier.classification == 'vehicle' && classifier.score > 0.75
        return find_spot.update!(taken: true)
      else
        find_spot.update!(taken: false)
      end
    end
  end

end
