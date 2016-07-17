class ConversationsController < ApplicationController
  before_action :deny_anonymous_user

  def new
  end

  def index
    @conversations = Conversation.involving(current_user)
    @friends = current_user.friends
  end

  def create
    if @conversation = Conversation.between(params[:sid], params[:rid]).present?
      @conversation = Conversation.between(params[:sid], params[:rid]).first
    else
      @conversation = Conversation.create!(sender_id: params[:sid], recipient_id: params[:rid])
    end
    update_last_open_conversation(@conversation)
    redirect_to @conversation
  end

  def show
    @conversation = Conversation.find(params[:id])
    @recipient = interlocutor(@conversation)
    @messages = @conversation.messages.where(user_id: @recipient.id).where(open_at: nil).order(:created_at)
    update_open_message(@messages)
    @message = @conversation.messages.new
  end

  private
    def interlocutor(conversation)
      current_user == conversation.sender ? conversation.recipient : conversation.sender
    end

    def update_open_message(messages)
      messages.each do |m|
        m.open_at = Time.now
        m.save!
      end
    end

    def update_last_open_conversation(conversation)
      conversation.updated_at = Time.now
      conversation.save!
    end
end
