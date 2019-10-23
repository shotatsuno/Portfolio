class CreateLinkThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :link_themes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string  :link_theme
      t.timestamps
    end
  end
end
