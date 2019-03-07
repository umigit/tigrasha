class AddImageToSightings < ActiveRecord::Migration[5.2]
  def change
    add_column :sightings, :image, :string
  end
end
