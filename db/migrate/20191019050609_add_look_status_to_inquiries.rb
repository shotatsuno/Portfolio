class AddLookStatusToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :look_status, :boolean, default: 0
  end
end
