class Article
  attr_accessor :title, :author, :url, :preview

  @@all = []

  def initialize(headline_hash)
    headline_hash.each do |key, value|
      self.send("#{key}", v)
    end
    @@all << self
  end

  def self.create_from_cli(articles_array)
    articles_array.each do |article_hash|
      self.new(article_hash)
    end
  end

end
