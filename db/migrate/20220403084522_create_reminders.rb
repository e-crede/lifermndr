class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :name
      t.date :date
      t.time :hour
      t.string :period
      t.string :recurrence
      t.boolean :active

      t.timestamps
    end
  end
end
