class AddNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :text, limit: 10, null:false
    add_column :users, :screenName, :text, limit: 10, null: false
  end
end
