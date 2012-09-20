class Reminder < ActiveRecord::Base
  attr_accessible :content, :priority

  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, :presence => true

  default_scope order: 'reminders.priority DESC'
end
