class DropTableFriends < ActiveRecord::Migration
  def change
  	drop_table :friends
  end
end
