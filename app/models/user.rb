class User < ActiveRecord::Base
  has_many :authentications
  has_many :reminders
  has_many :events, through: :reminders

  def self.find_or_create_from_auth_hash(auth_hash)
    info = auth_hash['info']
    extra_info = auth_hash['extra']['raw_info']

    find_or_create_by(email: info['email']) do |user|
      user.fullname = info['name']
      user.avatar   = info['image']
      user.gender   = extra_info['gender']
      user.birthday = Date.strptime(extra_info['birthday'], '%m/%d/%Y') if extra_info['birthday']
      user.region   = info['location']
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_access_token)
  end

  private

  def oauth_access_token
    authentications.facebook.token
  end
end
