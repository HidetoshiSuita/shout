class AddColumnsImgToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :img, :binary
  end
end
