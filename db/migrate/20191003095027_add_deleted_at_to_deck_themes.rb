class AddDeletedAtToDeckThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :deck_themes, :deleted_at, :datetime
    add_index :deck_themes, :deleted_at
  end
end
