class ReminderSchedule
  @@schedule_days = [1, 3, 10, 30, 100, 300]

  def initialize(date = nil)
    @date = date || Date.today
  end

  def remind_today?(article)
    return article.days_ago.in? @@schedule_days
  end

  def send_emails
    articles = []

    ArticleParser.new.all_articles do |article|
      if remind_today? article
        articles.append article
      end
    end

    ReminderMailer.reminder_links(articles).deliver_now
  end
end
