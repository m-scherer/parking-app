require 'rails_helper'

describe ImageClassifier do
  context '#create_classifiers' do
    it 'can create classifiers' do
      VCR.use_cassette('.image_classifier') do
        image_url = 'http://www.toyoland.com/photos/lexus/ls/LS-460.jpg'

        classifiers = ImageClassifier.create_classifiers(image_url)
        classifer = classifiers.first

        expect(classifiers).to be_instance_of(Array)
        expect(classifer).to be_instance_of(ImageClassifier)
        expect(classifer).to respond_to(:classification)
        expect(classifer).to respond_to(:score)
      end
    end
  end
end
