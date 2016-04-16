FactoryGirl.define do
  factory :event do
    title 'Concierto Coldplay'
    start_at 2.days.from_now
    category Category.all.sample
    manual false

    trait :public do
      type 'PublicEvent'
    end

    trait :private do
      type 'PrivateEvent'
    end
  end
end
