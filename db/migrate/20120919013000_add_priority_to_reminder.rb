class AddPriorityToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :priority, :integer
  end
end
