class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :content
      t.datetime :alarm
      t.integer :user_id

      t.timestamps
    end
  end
end
