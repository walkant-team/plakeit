class User < ActiveRecord::Base
  has_many :authentications
  # has_and_belongs_to_many :events

  def self.find_or_create_from_auth_hash(auth_hash)
    info = auth_hash['info']
    extra_info = auth_hash['extra']['raw_info']

    find_or_create_by(email: info['email']) do |user|
      user.fullname = info['name']
      user.avatar   = info['image']
      user.gender   = extra_info['gender']
      user.birthday = Date.strptime(extra_info['birthday'], '%m/%d/%Y')
      user.region   = info['location']
    end
  end
end
