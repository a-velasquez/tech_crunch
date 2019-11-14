class CLI

  def call
    greeting
    make_articles
    binding.pry
    recent_articles
    menu
    goodbye
  end

  def make_articles
    article_array = Scraper.scrape_headlines("https://techcrunch.com")
    Article.create_from_cli(article_array)
  end

  def add_full_article_to_headline
    Article.all.ech do |article|
      full_text = Scraper.scrape_full_text(article.href)
      article.add_full_text(full_text)
  end

  def greeting
    puts " Welcome to:"
    puts "--.--          |    ,---.                    |    "
    puts "  |  ,---.,---.|---.|    ,---..   .,---.,---.|---."
    puts "  |  |---'|    |   ||    |    |   ||   ||    |   |"
    puts "  `  `---'`---'`   '`---'`    `---'`   '`---'`   '"
    puts ""
  end

  def recent_articles     #lists most recent articles
    puts "Here's a list of the most recent articles:"
    @articles = Scraper.scrape_headlines
    @articles.each.with_index(1) do |post, index|
      puts "#{index}. #{post.name} by #{post.author}."
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "enter the number of the article you'd like to preview, or type 'recent' to see the list again"
      input = gets.strip.downcase

      if input.to_i > 0
        posting = @articles[input.to_i-1]
        puts "Here ya go!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "#{posting.preview}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "the full article can be found at: #{posting.url}"
      elsif input == "recent"
        puts recent_articles
      else
        puts "Hmmm. I didn't quite get that. Type 'recent' or 'exit.'"
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by see!"
  end

end
