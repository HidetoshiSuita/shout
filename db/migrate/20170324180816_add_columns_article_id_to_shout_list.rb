class AddColumnsArticleIdToShoutList < ActiveRecord::Migration[5.0]
  def change
    add_column :shout_lists, :article_id, :integer
  end
end
