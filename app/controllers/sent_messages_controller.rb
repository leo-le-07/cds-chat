class SentMessagesController < ApplicationController
  def index
  end

  def new
    @receiver = User.find(current_user.id)
  end

  def create
  end
end
