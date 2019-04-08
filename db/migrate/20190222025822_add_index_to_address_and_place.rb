class AddIndexToAddressAndPlace < ActiveRecord::Migration[5.2]
  def change
    add_index :sightings, :address
    add_index :sightings, :place
  end
end
