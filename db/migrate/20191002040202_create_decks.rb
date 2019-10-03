class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.integer :user, foreign_key: true
      t.integer :linktheme_id
      t.integer :decktheme_id
      t.integer :comment_id
      t.string :deck_name , null: false
      t.text :deck_detail
      t.integer :deck_status , default: 1

      t.timestamps
    end
  end
end
