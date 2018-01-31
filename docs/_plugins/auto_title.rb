require "jekyll"

module Jekyll

  # Auto Title Generator
  #
  # Sets {{page.title}} variable to
  #
  #  title value in front matter
  #  concat of h1 tags
  #  concat of h2 tags
  #
  class AutoImageGenerator < Generator
    def generate(site)
      @site = site

      site.posts.docs.each do |post|
        title = gen_title(post)
        post.data['title'] = title if title
      end
    end

    def gen_title(page)
      # if page.data['title']
      #   return page.data['title']
      # end

      # fix for jekyll 3.3.0
      @site.config['kramdown'] = @site.config['kramdown'].dup


      htmled = Jekyll::Renderer.new(@site, page, @site.site_payload).convert(page.content)
      titles = htmled.scan(/<h2[^>]*>([^<]*)<\/h2>/im)

      return titles.to_a.join('. ') if titles.length > 0
      return page.data['title']
    end

  end
end
