class AddEmailSchedule < ActiveRecord::Migration[5.1]
  def change
    create_table :email_schedules do |t|
      t.date :article_date
      t.date :email_date

      t.timestamps
    end
  end
end
