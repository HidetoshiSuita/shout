class AddColumnsUserAvailableToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_available, :boolean
  end
end
