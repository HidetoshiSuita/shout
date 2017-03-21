class AddColumnGenreIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :genre_id, :integer
  end
end
