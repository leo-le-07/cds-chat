class ConversationsController < ApplicationController
  def new
    params[:sid] = 3
    params[:rid] = 4
    @conversation = Conversation.between(params[:sid], params[:rid])
    @conversation = Conversation.create(sender_id: params[:sid], recipient_id: params[:rid]) unless @conversation
    @messages = @conversation.first.messages
  end

  def create
  end

  def show
  end
end
