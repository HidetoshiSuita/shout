class AddColumnsToImgContentToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :img_content, :string
  end
end
