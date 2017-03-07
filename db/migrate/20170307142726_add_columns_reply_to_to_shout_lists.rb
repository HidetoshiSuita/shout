class AddColumnsReplyToToShoutLists < ActiveRecord::Migration[5.0]
  def change
    add_column :shout_lists, :reply_to, :integer
  end
end
