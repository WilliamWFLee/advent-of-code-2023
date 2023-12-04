require_relative 'card'

answer = File.readlines('input.txt').map do |line|
  card = Card.from_string(line)
  card.score
end.sum

puts answer
