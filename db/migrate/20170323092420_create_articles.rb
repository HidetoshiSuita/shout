class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :tag
      t.text :comment
      t.binary :img
      t.integer :genre_id

      t.timestamps
    end
  end
end
