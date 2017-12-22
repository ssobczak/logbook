# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview
  def reminder_links
    schedule = ReminderSchedule.new
    articles = []

    ArticleParser.new.all_articles do |article|
      if schedule.remind_today? article
        articles.append article
      end
    end

    ReminderMailer.reminder_links(articles)
  end
end
