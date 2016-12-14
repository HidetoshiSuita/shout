class CreateShoutLists < ActiveRecord::Migration[5.0]
  def change
    create_table :shout_lists do |t|
      t.string :shout
      t.integer :user_id

      t.timestamps
    end
  end
end
