class RemoveFollowListFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :follow_list, :integer
  end
end
