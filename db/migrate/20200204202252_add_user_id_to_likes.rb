class AddUserIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :user_id, :integer, foreign_key: true
    add_index :likes, :user_id
  end
end
