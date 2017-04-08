class CreateHashTags < ActiveRecord::Migration[5.0]
  def change
    create_table :hash_tags do |t|
      t.integer :article_id
      t.string :tag

      t.timestamps
    end
  end
end
