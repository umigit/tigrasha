class RemoveUserididFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts ,:user_id_id, :references
  end
end
