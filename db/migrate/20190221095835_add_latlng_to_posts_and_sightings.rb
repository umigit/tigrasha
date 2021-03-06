class AddLatlngToPostsAndSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :lost_plase, null: false, default: ""
      t.datetime :lost_date, null: false, default: -> {'NOW()'}
      t.string :address
      t.text :detail
      t.timestamps
    end

    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
    add_column :sightings, :latitude, :float
    add_column :sightings, :longitude, :float
  end
end
