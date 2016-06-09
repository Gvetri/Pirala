class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,:omniauthable,:omniauth_providers => [:google_oauth2]

  def self.connect_to_google(auth)
    data = auth.info
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = data["email"]
      user.password = Devise.friendly_token[0,20]
      user.name = data["first_name"]
    end
  end

  def self.process_uri(uri)
    avatar_url = URI.parse(uri)
    avatar_url.scheme = 'https'
    avatar_url.to_s
  end

end
