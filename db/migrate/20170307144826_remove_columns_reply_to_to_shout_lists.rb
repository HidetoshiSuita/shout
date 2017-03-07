class RemoveColumnsReplyToToShoutLists < ActiveRecord::Migration[5.0]
  def change
    remove_column :shout_lists, :reply_to, :integer
  end
end
