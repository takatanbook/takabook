class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :friend_user_one
      t.string :friend_user_two
      t.integer :friend_user_status

      t.timestamps
    end
  end
end
