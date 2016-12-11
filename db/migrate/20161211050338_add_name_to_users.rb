class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false, default: ""
    #ユーザー名が重複しても問題がないようになっている
  end
end
