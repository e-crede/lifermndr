class AddPeriodsToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :_1d, :boolean
    add_column :reminders, :_7d, :boolean
    add_column :reminders, :_14d, :boolean
    add_column :reminders, :_30d, :boolean
    add_column :reminders, :_60d, :boolean
  end
end
