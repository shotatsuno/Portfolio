class AddColumnToDecks < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :follower_num, :integer, default: 0
    add_column :decks, :week, :integer, default: 0
  end
end
