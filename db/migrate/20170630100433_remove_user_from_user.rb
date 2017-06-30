class RemoveUserFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :screenName, :string
  end
end
