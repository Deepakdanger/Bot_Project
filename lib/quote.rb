require 'uri'
require 'net/http'
require 'openssl'
require_relative 'bot'
require 'json'
require 'telegram/bot'

class Quote
  @quote1 = nil
  def initialize
    @quote1 = quote_call
  end

  def quote_call
    url = URI('https://quotes21.p.rapidapi.com/quote')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-key'] = '074a87b56bmsh60e1cf8f06a4f4cp19bf61jsn0a432510ac80'
    request['x-rapidapi-host'] = 'quotes21.p.rapidapi.com'

    response = http.request(request)
    JSON.parse(response.body)
  end
end
