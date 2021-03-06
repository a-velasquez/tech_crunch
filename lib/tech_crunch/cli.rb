class CLI

  def run
    greeting
    make_articles
    recent_articles
    menu
  end

  def greeting
    puts ""
    puts " Welcome to:"
    puts " --.--          |    ,---.                    |    "
    puts "   |  ,---.,---.|---.|    ,---..   .,---.,---.|---."
    puts "   |  |---'|    |   ||    |    |   ||   ||    |   |"
    puts "   `  `---'`---'`   '`---'`    `---'`   '`---'`   '"
    puts ""
    puts " Latest articles loading..."
    puts divider
  end

  def make_articles
    article_array = Scraper.scrape_headlines("https://techcrunch.com") # - Scrapes headlines
    Article.create_from_cli(article_array) # - Creates initial instance of each Article object

    Article.all.each do |headline|
      full_text = Scraper.scrape_full_text(headline.href)
      headline.add_full_text(full_text) # - Adds full article text to each instance of Article
    end
  end

  def recent_articles
    Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title.upcase} By #{article.author}"
      puts ""
      puts "   #{article.preview.strip}"
      puts ""
      puts divider
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts " Enter the number of the article you'd like to read, 'list' to see the latest articles, or 'exit' to quit."
      input = gets.strip.downcase # - .strip to remove any whitespaces from input

      if input.to_i > 0 && input.to_i < 21
        selected_article = Article.all[input.to_i-1]
        puts ""
        puts  divider
        puts " #{selected_article.title.upcase}"
        puts " By #{selected_article.author}"
        puts ""
        puts " #{selected_article.full_text}"
        puts ""
        puts "the full article can be found at: #{selected_article.href}"
        puts divider
      elsif input == "list"
        recent_articles
      elsif input == "exit"
        goodbye
      else
        puts " Hmmm. I didn't quite get that" # - Message user gets if input is invalid.
      end
    end
  end

  def goodbye
    puts " 👋🏼 Thanks for stopping by!"
  end

  def divider # - Helps keep code DRY and with presentation.
    puts " ~" * 60
  end
end














#  Scraper.scrape_headlines("https://techcrunch.com")
#  Scraper.add_article
