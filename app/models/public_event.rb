class PublicEvent < Event
  scope :weekly, -> { where('start_at <= ?', Date.today.end_of_week)  }
end
