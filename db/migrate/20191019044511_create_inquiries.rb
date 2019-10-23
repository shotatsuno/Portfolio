class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.text :inquiry

      t.timestamps
    end
  end
end
