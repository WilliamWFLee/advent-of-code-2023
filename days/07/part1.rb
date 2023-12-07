require_relative 'card'
require_relative 'hand'
require_relative 'hand_identifier'

data = File.readlines('input.txt', chomp: true).map do |line|
  line.split(' ')
end

hands = data.map do |hand_string, bet_string|
  Hand.new(hand_string.chars.map { |value| Card.new(value) }, bet_string.to_i)
end

# Sort by card values first
(0..4).reverse_each do |card_index|
  hands.sort_by! { |hand| hand[card_index].number }
end

# Sort by hand type
hands.sort_by! { |hand| HandIdentifier.new(hand).number }

answer = hands.map.with_index(1) do |hand, rank|
  hand.bet * rank
end.sum

puts answer
