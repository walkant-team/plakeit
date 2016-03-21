class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_at
      t.string :address
      t.string :location
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :image
      t.integer :count_views

      t.timestamps null: false
    end
  end
end
