class AddFavoriteNumToDecks < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :favorite_num, :integer, default: 0
  end
end
