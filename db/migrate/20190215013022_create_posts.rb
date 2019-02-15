class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :lost_place, null: false
      t.datetime :lost_date, null: false, default: -> {'NOW()'}
      t.text :detail, null: false
      t.string :address, default: ""
      t.references :user
      t.timestamps
    end
  end
end
