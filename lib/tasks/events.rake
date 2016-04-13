require 'ffaker'
require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :events do
  desc 'Generate events accounts'
  task generate_test_events: :environment do
    Event.destroy_all

    50.times do
      title = FFaker::Product.product
      category = Category.all.sample

      event = Event.create!(
        title: title,
        category_id: category.id,
        start_at: Time.zone.now + rand(2..10).days,
        address: FFaker::Address.street_address,
        latitude: FFaker::Geolocation.lat,
        longitude: FFaker::Geolocation.lng,
        type: 'PublicEvent',
        publish: true,
        manual: false,
        region: 'Perú, Lima',
        # image: File.open("#{Rails.root}/spec/factories/files/business.jpeg")
        description: FFaker::Lorem.paragraphs
      )
      event.tag_list.add(ActsAsTaggableOn::Tag.all.sample(rand(1..3)).map(&:name).join(', '))
      event.save
    end
  end
end
