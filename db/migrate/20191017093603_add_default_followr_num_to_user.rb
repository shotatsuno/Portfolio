class AddDefaultFollowrNumToUser < ActiveRecord::Migration[5.2]
  def up
   change_column :users, :follower_num, :integer, default: 0
  end

  def down
    change_column :users, :follower_num, :integer
  end
end
