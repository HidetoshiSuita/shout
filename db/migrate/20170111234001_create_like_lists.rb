class CreateLikeLists < ActiveRecord::Migration[5.0]
  def change
    create_table :like_lists do |t|
      t.integer :shout_id
      t.integer :user_id

      t.timestamps
    end
  end
end
