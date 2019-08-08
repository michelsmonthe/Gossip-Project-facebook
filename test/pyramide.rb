
puts "Combien d'étage veux-tu?"
number = gets.chomp.to_i
number.times {|i|
  print " "*(2 * number - i)
  puts "#"*(2 * i + 1)}
