class AddColumnsShoutVerifyToShoutLists < ActiveRecord::Migration[5.0]
  def change
    add_column :shout_lists, :shout_verify, :integer
  end
end
