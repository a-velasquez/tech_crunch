colors = ["Orange", "Red", "Green"]
colors.each.with_index(2) do |color, index|
  puts "#{index}. Primary color #{color} is #{colors.length} letters long!"
end

# - drop does the opposite of take, by returning the elements after n elements have been dropped:
arr = [1, 2, 3, 4, 5, 6]
puts arr.drop(3) #=> [4, 5, 6]
