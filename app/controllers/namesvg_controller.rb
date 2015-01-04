class NamesvgController < ApplicationController
  def get
    path = "http://curliceu-lb-1045376369.us-east-1.elb.amazonaws.com/namesvg/?"
    params.each do |key, value|
      path += key + "=" + value + "&"
    end
    url = URI.parse(URI.encode(path))
    result = Net::HTTP.get_response(url)
    send_data result.body, :type => result.content_type, :disposition => 'inline'
  end
end
