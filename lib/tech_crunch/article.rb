class Article
  attr_accessor :title, :author, :href, :preview, :text

  @@all = []

  def initialize(headline_hash)
    headline_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.create_from_cli(articles_array)
    articles_array.each do |article|
      self.new(article)
    end
  end

  def add_full_text(article_hash)
    article_hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.all
    @@all
  end
end
