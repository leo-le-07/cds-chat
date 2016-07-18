class AddBannedToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :banned, :boolean, default: false
  end
end
