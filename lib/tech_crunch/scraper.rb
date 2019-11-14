require 'pry'

class Scraper

  def self.scrape_headlines(homepage_url)
    articles = []
    html = open(homepage_url)
    headlines = Nokogiri::HTML(open(html))
    headlines.css('div.post-block').each do |headline|
      headline_details = {}
      headline_details[:title] = headline.at_css('h2.post-block__title a').text.strip

      articles << headline_details
    end

    # a.title = doc.css("h2.post-block__title").text.strip.split("\t\t\t\n\t\t\n\t\t\t\n\t\t\t\t")
    # a.author = doc.css("div.post-block__meta div span").text.split("\t\t\t\n\t\t\t\n\t\t\t\t\t\n\t\t\t\t")
    # a.url = doc.css("a").attribute("href").value
    # a.preview = doc.css("div.post-block__content").text.split("\t\n\t\t")
    #
    # a
    articles
    binding.pry
  end


 end
