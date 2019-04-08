class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.string :plase, null: false, default: ""
      t.datetime :date, null: false, default: -> {'NOW()'}
      t.string :address
      t.references :post
      t.timestamps
    end
  end
end
