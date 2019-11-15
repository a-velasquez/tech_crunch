require 'pry'

class Scraper

  def self.scrape_headlines(homepage_url)
    articles = []
    html = open(homepage_url)
    headlines = Nokogiri::HTML(html)
    headlines.css('div.post-block').each do |headline|
      headline_details = {}
      headline_details[:author]  = headline.at_css('div.river-byline').css('.river-byline__authors').text.strip
      headline_details[:href]    = headline.at_css('h2.post-block__title a').attribute('href').value,
      headline_details[:preview] = headline.at_css('div.post-block__content').text.strip,
      headline_details[:title]   = headline.at_css('h2.post-block__title a').text.strip

      articles << headline_details
    end
    articles
  end


 end
