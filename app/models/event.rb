class Event < ActiveRecord::Base
  acts_as_taggable

  belongs_to :category
end
