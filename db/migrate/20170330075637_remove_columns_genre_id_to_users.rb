class RemoveColumnsGenreIdToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :genre_id, :integer
  end
end
