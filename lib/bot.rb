require 'telegram/bot'


class Bot
    def initialize
        token = '1678666426:AAFRzswoCB2wHgW-D2Xqg0afQeLqad0yrMo'

        Telegram::Bot::Client.run(token) do |bot|
            bot.listen do |message|
              case message.text
              when '/start'
                bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
              when '/stop'
                bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
              when '/health'
                bot.api.send_message(chat_id: message.chat.id, text: "How are u?, #{message.from.first_name}")
              end
            end
        end
    end

    
end