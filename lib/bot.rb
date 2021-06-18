# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/BlockLength
# rubocop:disable Layout/LineLength

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
        when 'hi', 'Hi', '🤚', '👋', '✋', '🖐'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, Welcome to 🕵🏻‍♂️ bot, If you are feeling down ,Let me Help you 🤪\n
            Press
            'start' => To know my Name\n
            'stop ' => To stop me from teasing you\n
            'health'=> To check health\n
            'nice'or '👌' => To Thanks me\n
            'joke'  => To get one good joke\n
            'quote' => To get one quote for start your Day\n")
        when 'start'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello, My Name is TOBOOOOOOT')
        when 'stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye Bye ,My friend 🤝 \n See U Sooooon")
        when 'nice', '👌'
          bot.api.send_message(chat_id: message.chat.id, text: 'Thanks you very much')
        when 'health'
          bot.api.send_message(chat_id: message.chat.id, text: "I am fine buddy 😎 \nHope U are doing well ")
        when 'joke'
          value = Joke.new
          final_joke = value.joke_call
          bot.api.send_message(chat_id: message.chat.id, text: "Funny joke 😜: #{final_joke['setup']}\n 😂 A: #{final_joke['punchline']} 🤣")
        when 'quote'
          val = Quote.new
          new_quote = val.quote1
          bot.api.send_message(chat_id: message.chat.id, text: "Today Motivational quote 😮: #{new_quote['quote']} \n Author :#{new_quote['author']}")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "Sorry you put an invalid entry, 😱 \n you need to write 'hi' to see the Instruction📚")
        end
      end
    end
  end
end

# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/BlockLength
# rubocop: enable Layout/LineLength
