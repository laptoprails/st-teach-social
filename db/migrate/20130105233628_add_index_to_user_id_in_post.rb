class AddIndexToUserIdInPost < ActiveRecord::Migration
  def change
  	add_index :posts, :user_id
  end
end
