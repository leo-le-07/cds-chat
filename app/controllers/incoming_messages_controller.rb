class IncomingMessagesController < ApplicationController
  before_action :deny_anonymous_user

  def index
  end
end
