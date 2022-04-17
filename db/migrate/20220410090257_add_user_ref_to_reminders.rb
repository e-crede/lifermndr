class AddUserRefToReminders < ActiveRecord::Migration[7.0]
  def change
    #rails g migration AddUserRefToReminders user:references
    add_reference :reminders, :user, null: false, foreign_key: true
  end
end
