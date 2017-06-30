class ChangeColumnToTweet < ActiveRecord::Migration[5.0]
  def up
    change_column :tweets, :content, :string, null: false
  end
  
  def down
    change_column :tweets, :content, :text, limit: 140
  end
end
