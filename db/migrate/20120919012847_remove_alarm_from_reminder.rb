class RemoveAlarmFromReminder < ActiveRecord::Migration
  def up
    remove_column :reminders, :alarm
  end

  def down
    add_column :reminders, :alarm, :datetime
  end
end
