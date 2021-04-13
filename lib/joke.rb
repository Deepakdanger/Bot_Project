require 'uri'
require 'net/http'
require 'openssl'
require_relative 'bot.rb'
require 'json'
require 'telegram/bot'

class Joke
    @joke1=nil
    def initialize
        @joke1=joke_call
    end
    def joke_call
        url = URI("https://jokeapi.p.rapidapi.com/category/%7Bcategory_name%7D?format=json")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = '074a87b56bmsh60e1cf8f06a4f4cp19bf61jsn0a432510ac80'
        request["x-rapidapi-host"] = 'jokeapi.p.rapidapi.com'

        response = http.request(request)
        response = JSON.parse(response.body)
        response
    end
end
