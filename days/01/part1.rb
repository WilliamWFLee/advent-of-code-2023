# Sum over the number calculated from each line
answer = File.readlines('input.txt', chomp: true).sum do |line|
  # Take all characters that are digits for each line into an array
  first_digit = line.match(/^\D*?(\d)/)[1]
  last_digit = line.match(/^.*(\d)\D*?$/)[1]

  # Join the first and last one
  "#{first_digit}#{last_digit}".to_i
end

puts answer
