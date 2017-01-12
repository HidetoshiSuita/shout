class RenameShoutIdColumnToLikeLists < ActiveRecord::Migration[5.0]
  def change
    rename_column :like_lists, :shout_id, :shout_list_id
  end
end
