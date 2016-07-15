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

  private
    def downcase_fields
      self[:email].downcase!
    end

end
