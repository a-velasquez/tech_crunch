class CLI

  def call
    greeting
    make_articles
    recent_articles
    menu
    binding.pry
    goodbye
  end

  def greeting
    puts ""
    puts "Welcome to:"
    puts "--.--          |    ,---.                    |    "
    puts "  |  ,---.,---.|---.|    ,---..   .,---.,---.|---."
    puts "  |  |---'|    |   ||    |    |   ||   ||    |   |"
    puts "  `  `---'`---'`   '`---'`    `---'`   '`---'`   '"
    puts ""
  end

  def make_articles
    article_array = Scraper.scrape_headlines("https://techcrunch.com") #scrapes headlines
    Article.create_from_cli(article_array) #creates initial instance of each Article object

    Article.all.each do |headline|
      full_text = Scraper.scrape_full_text(headline.href)
      headline.add_full_text(full_text) #adds full article text to each instance of Article
    end
  end

  def recent_articles     #lists most recent articles by calling Article.all and iterating
    puts "Here's a list of the most recent articles:"
    puts seperator
    Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title} By #{article.author}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "enter the number of the article you'd like to read, or type 'recent' to see the list again".white.bold
      input = gets.strip.downcase

      if input.to_i > 0
        selected_article = Article.all[input.to_i-1]
        puts ""
        puts seperator
        puts "#{selected_article.text}"
        puts seperator
        puts "the full article can be found at: #{selected_article.href}"
      elsif input == "recent"
        recent_articles
      else
        puts "Hmmm. I didn't quite get that. Type 'recent' or 'exit.'"
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by!"
  end

  def seperator
    puts "~".white.bold * 125
  end

end
