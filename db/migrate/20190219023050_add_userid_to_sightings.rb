class AddUseridToSightings < ActiveRecord::Migration[5.2]
  def up
    add_reference :sightings, :user, index: true
  end

  def down
    remove_column :sightings, :user, :references
  end
end
