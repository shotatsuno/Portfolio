class AddFollowerNumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :follower_num, :integer
  end
end
