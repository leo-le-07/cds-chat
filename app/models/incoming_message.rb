class IncomingMessage < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
end
