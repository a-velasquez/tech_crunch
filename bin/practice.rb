# = each.with_index(index_position) do |item, value|
colors = ["Orange", "Red", "Green"]
colors.each.with_index(1) do |color, index|
  puts "#{index}. Primary color #{color} is #{colors.length} letters long!"
end

doc = Nokogiri::HTML(open("https://techcrunch.com"))
byebug

a = Article.new
a.name = doc.css("h2.post-block__title").text.strip.split("\t\t\t\n\t\t\n\t\t\t\n\t\t\t\t")

# - A useful method if you need to remove nil values from an array is compact:
# arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
# arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
# arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
# arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']
# arr          #=> ['foo', 0, 'bar', 7, 'baz']

# - To return the first n elements of an array, use take
# arr.take(3) #=> [1, 2, 3]

# - drop does the opposite of take, by returning the elements after n elements have been dropped:
# arr = [1, 2, 3, 4, 5, 6]
# puts arr.drop(3) #=> [4, 5, 6]
