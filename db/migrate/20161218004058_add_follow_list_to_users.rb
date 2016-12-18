class AddFollowListToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :follow_list, :integer
  end
end
