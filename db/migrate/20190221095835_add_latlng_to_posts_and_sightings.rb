class AddLatlngToPostsAndSightings < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
    add_column :sightings, :latitude, :float
    add_column :sightings, :longitude, :float
  end
end
