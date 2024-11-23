require 'uri'
require 'net/http'

class PropertiesController < ApplicationController
  def get_properties(apiurl, apikey)
    url = URI(apiurl)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["X-Authorization"] = apikey

    response = http.request(request)
    body = response.read_body

    body = JSON.parse(body)

    return body['content']
  end

  def index
    @properties = get_properties("https://api.stagingeb.com/v1/properties?page=1&limit=20", "l7u502p8v46ba3ppgvj5y2aad50lb9")
  end
end
