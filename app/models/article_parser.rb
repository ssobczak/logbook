class ArticleParser
  @@articles_path = 'docs/_posts/'

  def all_articles
    article_files = Dir[@@articles_path + '*.md']
    header_re = Regexp.new /^---\n(\X+)\n---\n/

    for art_file in article_files do
      file_content = File.read(art_file)

      header_re.match(file_content) do |header|
        article_meta = YAML.load(header[0])
        yield Article.new(article_meta)
      end
    end
  end
end
