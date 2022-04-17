require 'telegram/bot'

class SendRemindersJob < ApplicationJob
  queue_as :default

  # TODO: Add Additional Filter criteria
  def filter
    reminders = Reminder.all
    matching_reminders = []
    reminders.each do |reminder|
    if reminder.active?
        matching_reminders.push(reminder)
    end 
    end
    matching_reminders
  end

  def send_telegram(msg)
    # FIXME: Load token and chat_id from yaml
    token = '5236303876:AAEk8OuEnjLxtm3L6pCJjdbAagJurPeSnb8'
    bot = Telegram::Bot::Client.new(token)
    bot.api.send_message(chat_id: 1792029600, text: "#{msg}")
  end
  def send_messages(matching_reminders)
    send_telegram("LifeRmndrs of today:")
    matching_reminders.each do |reminder|
      msg = "Upcoming event: #{reminder.name} at #{reminder.date}"
      send_telegram(msg)
    end
  end

  def perform(*args)
    matching_reminders = filter 
    send_messages(matching_reminders)
  end
end
