json.extract! reminder, :id, :name, :date, :hour, :period, :recurrence, :active, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
