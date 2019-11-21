class Article
  attr_accessor :author, :full_text, :href, :preview, :title

  @@all = []

  def initialize(headline_hash) # - Takes an argument of a hash from create_from_cli method
    headline_hash.each do |key, value|
      self.send("#{key}=", value) # - Sets attributes/values to key/value pairs from our hash
    end
    @@all << self
  end

  def self.create_from_cli(articles_array) # - Takes in array of hashes created by Scraper.scrape_headlines
    articles_array.each do |article|
      self.new(article) # - Creates new instances of Articles using each hash, giving each article its hash of details
    end
  end

  def add_full_text(article_hash) # - Instance method takes resulting hash from Scraper.scrape_full_text
    article_hash.each do |key, value|
      self.send("#{key}=", value)
      # self. operates on each instance of article to set key/value pairs of the hash to the corresponding attributes
    end
  end

  def self.all
    @@all
  end
end










# class Article
#   attr_accessor :author, :href, :preview, :full_text, :title
#
#   @@all = []
#
#   def initialize(title, preview, author, href, full_text = nil)
#     @.author = author
#     @href = href
#     @preview = preview
#     @full_text = full_text
#     @title = title
#     self.save
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
# end
