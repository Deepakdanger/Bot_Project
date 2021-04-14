require 'telegram/bot'
require_relative 'joke'
require_relative 'quote'
class Bot
  def initialize
    token = '1678666426:AAFRzswoCB2wHgW-D2Xqg0afQeLqad0yrMo'

    Telegram::Bot::Client.run(token, logger: Logger.new($stderr)) do |bot|
      bot.logger.info('Bot has been started')
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        when '/health'
          bot.api.send_message(chat_id: message.chat.id, text: "How are u?, #{message.from.first_name}")   
        when '/joke'
          value = Joke.new
          final_joke = value.joke_call
          bot.api.send_message(chat_id: message.chat.id, text: "Funny joke : #{final_joke['joke']}")
        when '/quote'
          val = Quote.new
          new_quote = val.quote_call
          bot.api.send_message(chat_id: message.chat.id, text: "Todays motivational quotes: #{new_quote['quote']} /n Author :#{new_quote['author']}")
        end
      end
    end
  end    
end
