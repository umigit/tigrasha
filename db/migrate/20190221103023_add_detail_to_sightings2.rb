class AddDetailToSightings2 < ActiveRecord::Migration[5.2]
  def change
    add_column :sightings, :detail, :text
  end
end
