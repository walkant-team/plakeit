class Event < ActiveRecord::Base
  acts_as_taggable

  belongs_to :category
  has_and_belongs_to_many :users
end
