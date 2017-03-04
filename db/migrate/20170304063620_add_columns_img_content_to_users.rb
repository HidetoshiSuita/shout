class AddColumnsImgContentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :img_content, :string
  end
end
