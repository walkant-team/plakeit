class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :event, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
