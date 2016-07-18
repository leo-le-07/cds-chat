class FriendBlocksController < ApplicationController
  def create
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.banned = true
    friendship.save
    flash[:success] = "#{friendship.friend.name} has been blocked!"
    redirect_to friendships_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.banned = false
    friendship.save
    flash[:success] = "#{friendship.friend.name} has been unblocked!"
    redirect_to friend_blocks_path
  end

  def index
    banned_friends_id = current_user.friendships.where(banned: true).select(:friend_id)
    @friends = current_user.friends.where("friend_id in (?)", banned_friends_id)
  end
end
