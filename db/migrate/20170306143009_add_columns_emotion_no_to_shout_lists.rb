class AddColumnsEmotionNoToShoutLists < ActiveRecord::Migration[5.0]
  def change
    add_column :shout_lists, :emotion_no, :integer
  end
end
