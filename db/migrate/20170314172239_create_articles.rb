class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :tag
      t.text :comment
      t.integer :shout_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
