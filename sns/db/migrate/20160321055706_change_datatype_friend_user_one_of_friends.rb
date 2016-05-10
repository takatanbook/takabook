class ChangeDatatypeFriendUserOneOfFriends < ActiveRecord::Migration
  def change
  	change_column :friends, :friend_user_one, :string
  	change_column :friends, :friend_user_two, :string
  end
end
