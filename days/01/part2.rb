NUMBERS = %w(one two three four five six seven eight nine)
FIRST_DIGIT_REGEX = /^\w*?(\d|#{NUMBERS.join('|')})/
LAST_DIGIT_REGEX = /^.*(\d|#{NUMBERS.join('|')})\w*?$/

def map_digit(digit)
  (digit =~ /\d/) ? digit : "#{NUMBERS.index(digit) + 1}"
end

# Sum over the number calculated from each line
answer = File.readlines('input.txt', chomp: true).sum do |line|
  first_digit = map_digit(line.match(FIRST_DIGIT_REGEX)[1])
  last_digit = map_digit(line.match(LAST_DIGIT_REGEX)[1])

  # Join the first and last digits
  puts "#{first_digit}#{last_digit}"
  "#{first_digit}#{last_digit}".to_i
end

puts answer
