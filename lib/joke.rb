require 'uri'
require 'net/http'
require 'openssl'
require_relative 'bot'
require 'json'
require 'telegram/bot'

class Joke
  @joke1 = nil
  def initialize
    @joke1 = joke_call
  end

  def joke_call
    url = URI('https://manatee-jokes.p.rapidapi.com/manatees/random')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-key'] = '074a87b56bmsh60e1cf8f06a4f4cp19bf61jsn0a432510ac80'
    request['x-rapidapi-host'] = 'manatee-jokes.p.rapidapi.com'

    response = http.request(request)
    JSON.parse(response.body)
  end
end
