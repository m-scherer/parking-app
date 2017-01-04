class ImageService

  def analyze_image(url)
    response = conn.get( '/visual-recognition/api/v3/classify', {
          api_key: ENV['IBM_WATSON_KEY'],
          url: url,
          version: '2016-05-19'
          } )
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://gateway-a.watsonplatform.net') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.headers["Accept-Encoding"] = ""
    end
  end

end
