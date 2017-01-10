class CreateFollowLists < ActiveRecord::Migration[5.0]
  def change
    create_table :follow_lists do |t|
      t.integer :user_id
      t.integer :follow_id

      t.timestamps
    end
  end
end
