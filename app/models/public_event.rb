class PublicEvent < Event
  is_impressionable

  scope :weekly, -> { where('start_at <= ?', Time.zone.today.end_of_week) }
  scope :not_weekly, -> { where('start_at > ?', Time.zone.today.end_of_week) }
  scope :by_category, ->(category) { where(category: category) if category.present? }

  def to_param
    [id, title.parameterize].join('-')
  end

  def assistants(current_user)
    assistants = users.last(8) - [current_user]

    exist?(current_user) ? assistants.unshift(current_user) : assistants
  end

  def exist?(current_user)
    return false unless current_user
    Reminder.exists?(event_id: id, user_id: current_user.id)
  end
end
