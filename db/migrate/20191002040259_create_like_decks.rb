class CreateLikeDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :like_decks do |t|
      t.integer :user_id
      t.integer :deck_id

      t.timestamps
    end
  end
end
