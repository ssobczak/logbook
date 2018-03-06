require "json"

module Jekyll
  class SumaryFile < StaticFile
    def add_page(page)
      @pages ||= []
      @pages << {
        collection: page.collection.label,
        date: page.data['date'].strftime('%F'),
        url: @site.config['url'] + page.url,
        title: page.data['title']
      }
    end

    def write(dest)
      out = JSON.generate(@pages)
      # Jekyll.logger.info out

      File.open(File.join(dest, @name), 'w') do |file|
        file.write(out)
      end
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      sumary = SumaryFile.new(site, site.dest, "/", 'sumary.json')

      # site.collections.each do |coll_name, coll|
        site.documents.each do |page|
          sumary.add_page(page)
        end
      # end

      site.static_files << sumary
    end
  end
end
