class Scraper

  def self.scrape_headlines(homepage_url)
    articles = [] # - Empty array to collect hashes below, each hash representing instance of article
    headlines = Nokogiri::HTML(open(homepage_url)) # - Nodeset set to local variable, to iterate over
    headlines.css('.post-block').each do |headline|
      headline_details = {}
      headline_details[:author]  = headline.at_css('div.river-byline').css('.river-byline__authors').text.strip
      headline_details[:href]    = headline.at_css('h2.post-block__title a').attribute('href').value
      headline_details[:preview] = headline.at_css('div.post-block__content').text.strip
      headline_details[:title]   = headline.at_css('h2.post-block__title a').text.strip

      articles << headline_details
    end
    articles
  end

  def self.scrape_full_text(article_href) # - Takes argument of article's own href
    full_articles = {} # - Sets empty hash to collect text
    article_landing = Nokogiri::HTML(open(article_href))
    article_landing.css('div.article-content').each do |article| # - Iterate over nodeset to capture article text
      full_articles[:full_text] = article_landing.css('p').text.strip
    end
    full_articles # - Returning hash
  end
end





# class Scraper
#
#   def self.scrape_headlines(homepage_url)
#
#     headlines = Nokogiri::HTML(open(homepage_url))
#     headlines.css('.post-block').each do |headline|
#       title   = headline.at_css('h2.post-block__title a').text.strip
#       preview = headline.at_css('div.post-block__content').text.strip
#       author  = headline.at_css('div.river-byline').css('.river-byline__authors').text.strip
#       href    = headline.at_css('h2.post-block__title a').attribute('href').value
#       #  full_article = Nokogiri::HTML(open(href))
#       #  full_article.css('div.article-content').each do |article|
#       #     full_text = full_article.css('p').text
#           Article.new(title, preview, author, href)
#       #  end
#      end
#    end
#
#    def self.add_article
#      Article.all.each do |article|
#        article_landing = Nokogiri::HTML(open(article.href))
#        article_landing.css('div.article-content')
#        article.full_text = article_landing.css('p').text
#      end
#    end
#
# end
