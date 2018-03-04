class AddIsSentToEmailSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :email_schedules, :is_sent, :bool
  end
end
