class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :friend_id
      t.string :comment
      t.string :user_name

      t.timestamps
    end
  end
end
