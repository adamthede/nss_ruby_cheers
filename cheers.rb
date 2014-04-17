# From irb:

# my_array = ["foo", "bar", "grill"]

# my_array.each do |item|
#  puts item.capitalize
# end

puts "What's your name?"
name = gets.chomp

name = name.gsub(/\d+/, "").squeeze(" ").strip

# puts "Your name is: " + name

vowels = ["A", "E", "I", "O", "U", "F", "H", "L", "M", "N", "R", "S", "X"]

name.each_char do |character|
  if vowels.include?(character.capitalize)
    puts "Give me an ... " + character.capitalize
  else
    puts "Give me a .... " + character.capitalize
  end
end

puts name.upcase + "'s just GRAND!"
