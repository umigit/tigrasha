class AddPlaceToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :lost_plase
    add_column :posts, :lost_place, :string, null: false
  end
end
