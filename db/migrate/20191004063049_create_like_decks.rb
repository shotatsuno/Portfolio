class CreateLikeDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :like_decks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :user, foreign_key: true
      t.references :deck, foreign_key: true

      t.timestamps
      t.index [:user_id, :deck_id], unique: true
    end
  end
end
