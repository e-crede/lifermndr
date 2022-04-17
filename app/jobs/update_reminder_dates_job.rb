class UpdateReminderDatesJob < ApplicationJob
  queue_as :default


  def update_reminder_schedulle(reminder)
    reminder.active = false if reminder.recurrence == 'once'
    reminder.date = reminder.date.advance(days: 7) if reminder.recurrence == 'weekly'
    reminder.date = reminder.date.advance(months: 1) if reminder.recurrence == 'monthly'
    reminder.date = reminder.date.advance(years: 1) if reminder.recurrence == 'yearly'
    reminder.save
  end

  def update
    reminders = Reminder.all
    reminders.each do |reminder|
      # Check if reminder already occured, if so - update the database
      if reminder.active? && (reminder.date < Date.today)
        update_reminder_schedulle(reminder)
      end
    end
  end
  def perform(*args)
    update
  end
end
