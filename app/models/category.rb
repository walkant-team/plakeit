class Category < ActiveRecord::Base
  has_many :events

  validates :name, presence: true, uniqueness: true
end
