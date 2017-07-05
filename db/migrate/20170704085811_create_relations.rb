class CreateRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|
      t.references  :user,         index: true, null: false, foreign_key: true
      t.integer     :following_id, index: true, null: false

      t.timestamps
    end
  end
end
