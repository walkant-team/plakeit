class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname, null: false
      t.string :email, null: false
      t.string :phone
      t.string :gender # gender => ['male', 'female']
      t.date :birthday
      t.string :region
      t.string :avatar
      t.timestamps null: false
    end
  end
end
