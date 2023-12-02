NUMBERS = %w(one two three four five six seven eight nine)
DIGIT_REGEX = /^(\d|#{NUMBERS.join('|')})/

def map_digit(digit)
  (digit =~ /\d/) ? digit : "#{NUMBERS.index(digit) + 1}"
end

# Sum over the number calculated from each line
answer = File.readlines('input.txt', chomp: true).sum do |line|
  # Starting from each character on the line.
  # This ensures that overlapping digits are captured.
  digits = (0...line.length)
    .map do |start|
      line[start..line.length].scan(DIGIT_REGEX)
    end.flatten
    # Map these digits to the numeral digit
    .map{ |digit| map_digit(digit) }

  # Join the first and last digits
  "#{digits.first}#{digits.last}".to_i
end

puts answer
