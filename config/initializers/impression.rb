# Use this hook to configure impressionist parameters
#Impressionist.setup do |config|
  # Define ORM. Could be :active_record (default), :mongo_mapper or :mongoid
  # config.orm = :active_record
#end

# problem with method impressionist_count
# when have a class inheritance not
# found results correct; we create a replace
# method call impression_count
#
# SELECT DISTINCT COUNT(DISTINCT "impressions"."request_hash") FROM "impressions" WHERE "impressions"."impressionable_id" = $1 AND "impressions"."impressionable_type" = $2  [["impressionable_id", 1], ["impressionable_type", "Event"]]

module ActiveRecordExtensions
  extend ActiveSupport::Concern

  def impression_count
    Impression.where(impressionable_id: id, impressionable_type: self.class.to_s).select(:request_hash).distinct.count
  end

  module ClassMethods
  end

end

# Include above methods in all models.
ActiveRecord::Base.send(:include, ActiveRecordExtensions)
