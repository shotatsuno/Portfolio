class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.references :user, foreign_key: true
      t.integer :link_theme_id
      t.integer :deck_theme_id
      t.integer :comment_id
      t.string :deck_name , null: false
      t.text :deck_detail
      t.boolean :deck_status , default: false, null: false

      t.timestamps
    end
  end
end
