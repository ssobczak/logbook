class ReminderMailer < ApplicationMailer
  default from: 'reminder@ssobczak.net'

  def reminder_links(articles)
    @articles = articles

    mail to: 'szymon.sobczak@gmail.com', subject: 'Daily reminder'
  end
end
