class RemoveFollowerNumFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :follower_num, :integer
  end
end
