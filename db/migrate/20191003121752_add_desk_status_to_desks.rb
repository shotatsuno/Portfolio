class AddDeskStatusToDesks < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :deck_status, :boolean, default: false, null: false
  end
end
