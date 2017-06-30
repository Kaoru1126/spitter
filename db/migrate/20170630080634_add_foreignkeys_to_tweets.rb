class AddForeignkeysToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :user, :integer, null: false
  end
end
