class Article
  attr_accessor :title, :author, :url, :preview

  @@all = []

  def initialize(headline_hash)
    headline_hash.each do |key, value|
      self.send("#{key}", v)
    end
    @@all << self
  end

  def self.create_from_cli(articles)
    articles.each do |article|
      self.new(article)
    end
  end

  def self.all
    @@all
  end

end
