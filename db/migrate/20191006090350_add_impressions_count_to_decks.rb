class AddImpressionsCountToDecks < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :impressions_count, :integer, default: 0
  end
end
