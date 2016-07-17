class ConversationEmailsController < ApplicationController
  def new
    @conversation = Conversation.new
  end

  def create
    recipient = User.find_by_email(conversation_params[:email])
    if recipient
      if conversation = Conversation.between(current_user.id, recipient.id).present?
        conversation = Conversation.between(current_user.id, recipient.id).first
      else
        conversation = Conversation.create!(sender_id: current_user.id, recipient_id: recipient.id)
      end
    else
      new_user = User.create!(name: conversation_params[:email], email: conversation_params[:email], password: "123", registered: false)
      conversation = Conversation.create!(sender_id: current_user.id, recipient_id: new_user.id)
    end
    conversation.messages.create!(content: conversation_params['content'], user_id: current_user.id)
    flash[:success] = "Your message has sent"
    redirect_to root_path
  end

  private
    def conversation_params
      params.permit(:email, :content)
    end
end
