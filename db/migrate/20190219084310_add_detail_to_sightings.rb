class AddDetailToSightings < ActiveRecord::Migration[5.2]
  def change

    change_column :sightings, :detail, :text, null: false
  end
end
