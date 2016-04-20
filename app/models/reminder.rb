class Reminder < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :user, :event, presence: true
  validates :user_id, uniqueness: { scope: :event_id }
end
