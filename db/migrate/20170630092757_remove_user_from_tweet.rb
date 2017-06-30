class RemoveUserFromTweet < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :user, :integer
  end
end
