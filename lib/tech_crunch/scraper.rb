class Scraper

  def self.scrape_headlines(homepage_url)

    headlines = Nokogiri::HTML(open(homepage_url))
    headlines.css('.post-block').each do |headline|
      title = headline.at_css('h2.post-block__title a').text.strip
      preview = headline.at_css('div.post-block__content').text.strip
      author = headline.at_css('div.river-byline').css('.river-byline__authors').text.strip
      href = headline.at_css('h2.post-block__title a').attribute('href').value
       full_article = Nokogiri::HTML(open(href))
       full_article.css('div.article-content').each do |article|
          full_text = full_article.css('p').text
          Article.new(title, preview, author, href, full_text)
       end
     end
   end

 end
  # def self.scrape_headlines(homepage_url)
  #   articles = []
  #   headlines = Nokogiri::HTML(open(homepage_url))
  #   headlines.css('.post-block').each do |headline|
  #     headline_details = {}
  #     headline_details[:title]   = headline.at_css('h2.post-block__title a').text.strip
  #     headline_details[:preview] = headline.at_css('div.post-block__content').text.strip
  #     headline_details[:author]  = headline.at_css('div.river-byline').css('.river-byline__authors').text.strip
  #     headline_details[:href]    = headline.at_css('h2.post-block__title a').attribute('href').value
  #
  #     articles << headline_details
  #   end
  #   articles
  # end

  # def self.scrape_full_text(article_href)
  #   full_articles = {}
  #   full_text = Nokogiri::HTML(open(article_href))
  #   full_text.css('div.article-content').each do |article|
  #     full_articles[:text] = full_text.css('p').text
  #   end
  #   full_articles
  # end
