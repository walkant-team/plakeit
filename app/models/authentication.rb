class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.find_or_create_from_auth_hash(auth_hash)
    auth = find_by(provider: auth_hash['provider'], uid: auth_hash['uid'])
    unless auth
        user = User.find_or_create_from_auth_hash(auth_hash)

        auth_create_attributes = {
            :provider   => auth_hash['provider'],
            :uid        => auth_hash['uid'],
            :token      => auth_hash['credentials']['token']
        }

        auth = user.authentications.create!(auth_create_attributes)
    end
    auth
  end
end
