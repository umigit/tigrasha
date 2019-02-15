class AddTitleToPosts < ActiveRecord::Migration[5.2]
  def up
    add_column :posts, :title, :string, null: false
  end

  def down
    remove_column :posts, :title, :string
  end

end
