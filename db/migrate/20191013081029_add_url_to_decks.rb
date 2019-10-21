class AddUrlToDecks < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :url, :string
  end
end
