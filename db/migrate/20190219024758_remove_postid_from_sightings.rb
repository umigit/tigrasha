class RemovePostidFromSightings < ActiveRecord::Migration[5.2]
  def up
    remove_column :sightings, :post_id
  end
end
