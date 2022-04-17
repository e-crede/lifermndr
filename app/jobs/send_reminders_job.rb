require 'telegram/bot'

class SendRemindersJob < ApplicationJob
  queue_as :default

  # TODO: Add Additional Filter criteria
  def filter
    reminders = Reminder.all
    matching_reminders = []
    reminders.each do |reminder|
    if reminder.active?
        matching = subfilter_date(reminder)
        matching_reminders.push(reminder) if matching
    end 
    end
    matching_reminders
  end

  def subfilter_date(reminder)
    matching = false
    remaining_days = (reminder.date - Date.today).to_int
    matching = true if (remaining_days - 60 == 0 ) && reminder._60d
    matching = true if (remaining_days - 30 == 0 ) && reminder._30d
    matching = true if (remaining_days - 14 == 0 ) && reminder._14d
    matching = true if (remaining_days - 7 == 0 ) && reminder._7d
    matching = true if (remaining_days - 1 == 0 ) && reminder._1d
    matching = true if (remaining_days == 0 )
    matching
  end

  def send_telegram(msg)
    # FIXME: Load token and chat_id from yaml
    token = '5236303876:AAEk8OuEnjLxtm3L6pCJjdbAagJurPeSnb8'
    bot = Telegram::Bot::Client.new(token)
    bot.api.send_message(chat_id: 1792029600, text: "#{msg}")
  end
  
  def send_messages(matching_reminders)
    msg = "LifeRmndrs for #{Date.today}:\n"
    matching_reminders.each do |reminder|
      msg_partial = "- #{reminder.name} at #{reminder.date}\n"
      msg += msg_partial
    end
    send_telegram(msg)
  end

  def perform(*args)
    matching_reminders = filter 
    send_messages(matching_reminders)
  end
end
