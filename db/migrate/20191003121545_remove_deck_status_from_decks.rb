class RemoveDeckStatusFromDecks < ActiveRecord::Migration[5.2]
  def change
    remove_column :decks, :deck_status, :integer
  end
end
