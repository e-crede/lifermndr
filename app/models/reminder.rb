class Reminder < ApplicationRecord
    belongs_to :user
    validates :name, :date, :recurrence, presence: true
end
