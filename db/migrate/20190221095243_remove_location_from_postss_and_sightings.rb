class RemoveLocationFromPostssAndSightings < ActiveRecord::Migration[5.2]
  def change
    # remove_column :posts, :location
    remove_column :sightings, :location
  end
end
