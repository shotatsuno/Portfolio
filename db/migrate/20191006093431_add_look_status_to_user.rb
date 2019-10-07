class AddLookStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :look_status, :integer ,default: 0
  end
end
