class PublicEvent < Event
  is_impressionable

  scope :weekly, -> { where('start_at <= ?', Date.today.end_of_week)  }
  scope :not_weekly, -> { where('start_at > ?', Date.today.end_of_week) }
  scope :by_category, ->(category) { where(category: category) if category.present?  }
end
