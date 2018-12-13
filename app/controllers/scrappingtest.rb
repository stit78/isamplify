# require 'open-uri'
# require 'nokogiri'

# url = "https://dailycoffeenews.com"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# title = []
# html_doc.search('.blog-post h1 a').each do |element|
#   title << element.text.strip
#   # puts element.attribute('href').value
# end
# p title

# author = []
# html_doc.search('.blog-post .byline-date > a').each do |element|
#   author << element.text.strip
#   # puts element.attribute('href').value
# end
# p author

# picture_scrap = []
# html_doc.search('.blog-post .blog-featured-bg-image').each do |element|
#   picture_scrap << element.attribute('style').value
# end

# picture_urls = []
# picture_scrap.each do |element|
#   if element.nil?
#     picture_urls << ["https://5rewou8vp5-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/coffee-tree.jpg", "http://www.motifcoffee.com/sites/default/files/paragraph-images/2017-09/About-Coffee-Plant_546634210.jpg", "http://cdn2.hubspot.net/hub/57382/file-14822877-jpg/images/loved_import_coffee_beans.jpg?t=1464200267579&width=362&height=319"].sample
#   else
#     matcher = element.match("https?:\/\/.*\.(?:png|jpg)")
#     if matcher.nil?
#       picture_url = ["https://5rewou8vp5-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/coffee-tree.jpg", "http://www.motifcoffee.com/sites/default/files/paragraph-images/2017-09/About-Coffee-Plant_546634210.jpg", "http://cdn2.hubspot.net/hub/57382/file-14822877-jpg/images/loved_import_coffee_beans.jpg?t=1464200267579&width=362&height=319"].sample
#     else
#       picture_url = matcher[0]
#     end
#     picture_urls << picture_url
#   end
# end
# p picture_urls

# text = []
# html_doc.search('.home-excerpt').each do |element|
#   text << element.text.strip
#   # puts element.attribute('href').value
# end
# p text
