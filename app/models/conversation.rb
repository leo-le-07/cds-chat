class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end

  scope :involving, -> (user) do
    banned_friends_id = user.friendships.where(banned: true).select(:friend_id)
    if banned_friends_id.any?
      where("(conversations.sender_id = ? OR conversations.recipient_id = ?) AND conversations.sender_id NOT IN (?) AND conversations.recipient_id NOT IN (?)", user.id, user.id, banned_friends_id, banned_friends_id).order(updated_at: :desc)
    else
      where("conversations.sender_id = ? OR conversations.recipient_id = ?", user.id, user.id).order(updated_at: :desc)
    end
  end

  def interlocutor(current_user)
    sender == current_user ? recipient : sender
  end
end
