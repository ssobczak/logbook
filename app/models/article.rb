class Article
  @@url_base = 'https://ssobczak.github.io/logbook/'

  attr_reader :date, :title

  def initialize(metadata)
    @title = metadata['title']
    @date = metadata['date']
    @categories = metadata['categories']
  end

  def days_ago
    (Date.today - date).to_int
  end

  def url
    @@url_base + "daily/#{@date.year}/#{@date.month}/#{@date.day}/#{@title.downcase}.html"
  end
end
