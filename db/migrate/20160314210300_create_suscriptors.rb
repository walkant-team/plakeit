class CreateSuscriptors < ActiveRecord::Migration
  def change
    create_table :suscriptors do |t|
      t.string :email
      t.string :type

      t.timestamps null: false
    end
  end
end
