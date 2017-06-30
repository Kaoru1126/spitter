class AddUserRefToTweets < ActiveRecord::Migration[5.0]
  def change
    add_reference :tweets, :user, foreign_key: true, null: false
  end
end
