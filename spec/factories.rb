FactoryGirl.define do
  factory :event do
    title 'Concierto Coldplay'
    start_at 2.days.from_now
    category Category.all.sample
    manual false
    type 'PublicEvent'
  end
end
