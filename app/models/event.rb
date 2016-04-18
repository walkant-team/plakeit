class Event < ActiveRecord::Base
  acts_as_taggable
  attachment :image, type: :image

  belongs_to :category
  # has_and_belongs_to_many :users

  validates :title, :start_at, :category, presence: true
end
