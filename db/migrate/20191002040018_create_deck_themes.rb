class CreateDeckThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :deck_themes do |t|
      t.string :deck_theme
      t.timestamps
    end
  end
end
