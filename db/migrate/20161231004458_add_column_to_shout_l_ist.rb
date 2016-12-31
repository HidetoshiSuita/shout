class AddColumnToShoutLIst < ActiveRecord::Migration[5.0]
  def change
    add_column :shout_lists, :resp_shout, :integer
  end
end
