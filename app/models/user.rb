class User < ApplicationRecord
  before_create :downcase_fields

  has_secure_password

  has_many :conversations
  has_many :messages
  has_many :friends, through: :friendships
  has_many :friendships

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def self.login(email, password)
    user = User.find_by(email: email.downcase)
    unless user
      return nil
    end
    user if user.try(:authenticate, password)
  end

  def self.from_omniauth(auth)
    # user = User.where(provider: auth.provider, uid: auth.uid).first
    # unless user

    # end
    # user
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      if auth.info.email
        user.email = auth.info.email
      else
        user.email = "#{auth.uid}@facebook.com"
      end
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password="123"
      user.save!
    end
  end

  def short_name_avatar
    name.scan(/\b[a-z]/i).join.upcase.first(2)
  end

  private
    def downcase_fields
      self[:email].downcase!
    end

end
