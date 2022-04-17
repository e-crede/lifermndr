require 'rufus-scheduler'

return if defined?(Rails::Console) || Rails.env.test? || File.split($PROGRAM_NAME).last == 'rake'
return if $PROGRAM_NAME.include?('spring')

s = Rufus::Scheduler.singleton

s.cron '30 6 * * *' do
  Rails.logger.info "Executing schedulled jobs at #{Time.now}"
  SendRemindersJob.perform_later
  UpdateReminderDatesJob.perform_later
  Rails.logger.flush
end