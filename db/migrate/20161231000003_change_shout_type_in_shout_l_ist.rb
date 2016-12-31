class ChangeShoutTypeInShoutLIst < ActiveRecord::Migration[5.0]
  def change
    change_column :shout_lists, :shout, :text
  end
end
