class MessagesController < ApplicationController
  before_action :deny_anonymous_user
end
