module ConversationsHelper
  def recieved_messages(conversation)
    recipient = interlocutor(conversation)
    messages = conversation.messages.where(user_id: recipient.id).where(open_at: nil).order(:created_at)
  end

  def owner_last_message?(conversation)
    message = conversation.messages.last
    message.user_id == current_user.id
  end

  def time_open_last_message(conversation)
    message = conversation.messages.last
    if message.open_at
      message.open_at.strftime("%H:%M %d %b")
    end
  end

  def time_recieved_last_message(conversation)
    message = conversation.messages.last
    message.created_at.strftime("%H:%M %d %b")
  end

  def all_messages_open?(conversation)
    messages = conversation.messages.where(open_at: nil)
    !messages.any?
  end

  private
    def interlocutor(conversation)
      current_user == conversation.sender ? conversation.recipient : conversation.sender
    end
end
