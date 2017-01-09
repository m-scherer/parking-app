require 'rails_helper'

describe ImageService do
  context '#analyze_image' do
    it 'returns a hash response' do
      VCR.use_cassette(".image") do
        url = "http://cdn.patchcdn.com/users/2213323/2015/01/T800x600/20150154c0137516b2b.png"
        image_response = ImageService.new.analyze_image(url)

        expect(image_response).to be_instance_of(Hash)
        expect(image_response).to have_key(:images)
      end
    end
  end
end
