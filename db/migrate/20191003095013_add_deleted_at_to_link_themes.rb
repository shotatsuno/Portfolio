class AddDeletedAtToLinkThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :link_themes, :deleted_at, :datetime
    add_index :link_themes, :deleted_at
  end
end
