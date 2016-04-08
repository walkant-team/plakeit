class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.string :address
      t.string :location
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :image
      t.integer :count_views, default: 0
      t.string :type # types => [public, private]
      t.boolean :manual, default: true # true => business, false => scrapping
      t.boolean :publish, default: false # true => active, false => [:draft, :past]
      t.string :region # ejem => 'Perú, Lima', 'Argentina, Buenos Aires'
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
