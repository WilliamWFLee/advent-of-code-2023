# Sum over the number calculated from each line
answer = File.readlines('input.txt', chomp: true).sum do |line|
  # Take all characters that are digits for each line into an array
  digits = line.chars.filter{ |char| char =~ /\d+/ }
  # Join the first and last one
  "#{digits.first}#{digits.last}".to_i
end

puts answer
