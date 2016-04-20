class Event < ActiveRecord::Base
  acts_as_taggable
  attachment :image, type: :image

  belongs_to :category
  has_many :reminders
  has_many :users, through: :reminders

  validates :title, :start_at, :category, presence: true
end
