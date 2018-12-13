class Scrapper
  def call
    require 'open-uri'
    require 'nokogiri'

    url = "https://dailycoffeenews.com"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    urls = []
    html_doc.search('.blog-post .blog-featured-bg-image > a').each do |element|
      urls << element.attribute('href').value
    end
    p urls

    titles = []
    html_doc.search('.blog-post .col-sm-8 h1 a').each do |element|
      titles << element.text.strip.capitalize
    end
    p titles

    authors = []
    html_doc.search('.blog-post .col-sm-8 .byline-date > a').each do |element|
      authors << element.text.strip
    end
    p authors

    pictures_scrap = []
    html_doc.search('.blog-post .blog-featured-bg-image').each do |element|
      pictures_scrap << element.attribute('style').value
    end

    picture_urls = []
    pictures_scrap.each do |element|
      if element.nil?
        picture_urls << "https://5rewou8vp5-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/coffee-tree.jpg"
      else
        matcher = element.match("https?:\/\/.*\.(?:png|jpg)")
        if matcher.nil?
          picture_url = "https://5rewou8vp5-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/coffee-tree.jpg"
        else
          picture_url = matcher[0]
        end
        picture_urls << picture_url
      end
    end

    p picture_urls

    texts = []
    html_doc.search('.col-sm-8 .home-excerpt').each do |element|
      texts << element.text.strip
      # puts element.attribute('href').value
    end

    p texts

    return {
      urls: urls,
      titles: titles,
      authors: authors,
      picture_urls: picture_urls,
      texts: texts
    }
  end


end
