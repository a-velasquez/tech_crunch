class CLI

  def call
    greeting
    make_articles
    # add_full_article_to_headline
    recent_articles
    menu
    binding.pry
    goodbye
  end

  def make_articles
    article_array = Scraper.scrape_headlines("https://techcrunch.com") #scrapes headlines
    Article.create_from_cli(article_array) #creates initial instance of each Article object

    Article.all.each do |headline| #adds full article text to each instance of Article
      full_text = Scraper.scrape_full_text(headline.href)
      headline.add_full_text(full_text)
    end
  end

  def greeting
    puts " Welcome to:"
    puts "--.--          |    ,---.                    |    "
    puts "  |  ,---.,---.|---.|    ,---..   .,---.,---.|---."
    puts "  |  |---'|    |   ||    |    |   ||   ||    |   |"
    puts "  `  `---'`---'`   '`---'`    `---'`   '`---'`   '"
    puts ""
  end

  def recent_articles     #lists most recent articles by calling Article.all and iterating
    puts "Here's a list of the most recent articles:"
    Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title} By #{article.author}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "enter the number of the article you'd like to read, or type 'recent' to see the list again"
      input = gets.strip.downcase

      if input.to_i > 0
        posting = Article.all[input.to_i-1]
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "#{posting.text}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "the full article can be found at: #{posting.href}"
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

end
