require 'pry'

class Scraper

  def self.read
    self.scrape_articles
  end

  def self.scrape_articles
    articles = []

    articles << self.scrape_tech_crunch

    articles
    binding.pry
  end

  def self.scrape_tech_crunch
    doc = Nokogiri::HTML(open("https://techcrunch.com"))

    a = Article.new
    a.title = doc.css("h2.post-block__title").text.strip.split("\t\t\t\n\t\t\n\t\t\t\n\t\t\t\t")
    a.author = doc.css("div.post-block__meta div span").text.split("\t\t\t\n\t\t\t\n\t\t\t\t\t\n\t\t\t\t")
    a.url = doc.css("a").attribute("href").value
    a.preview = doc.css("div.post-block__content").text.split("\t\n\t\t")

    a
  end
 end
