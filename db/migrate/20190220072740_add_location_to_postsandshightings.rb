class AddLocationToPostsandshightings < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :location, :string
    add_column :sightings, :location, :string
  end
end
