class DropTableLikeDecks < ActiveRecord::Migration[5.2]
  def change
    drop_table :like_decks
  end
end
