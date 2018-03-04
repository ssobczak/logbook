class EmailSchedule < ApplicationRecord
  def self.scheduled?(date)
    EmailSchedule.where(article_date: date).size > 0
  end
end
