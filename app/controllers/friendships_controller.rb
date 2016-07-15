class FriendshipsController < ApplicationController
  before_action :deny_anonymous_user

  def index
    @friends = current_user.friends
  end

  def new
    friends = current_user.friends.all.select(:id)
    @new_friends = User.where.not(id: friends).where.not(id: current_user.id).order(:name)
  end

  def create
    friend = current_user.friendships.new(friend_id: params[:friend_id])
    if friend.save
      flash[:success] = "Add new friend success"
      redirect_to new_friendship_path
    else
      flash[:error] = "Something wrong!"
      redirect_to new_friendship_path
    end
  end
end
