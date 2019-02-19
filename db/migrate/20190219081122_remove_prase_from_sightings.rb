class RemovePraseFromSightings < ActiveRecord::Migration[5.2]
  def change
    remove_column :sightings, :plase
    add_column :sightings, :place, :string, null: false
  end
end
