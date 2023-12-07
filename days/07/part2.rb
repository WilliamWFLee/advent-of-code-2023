require_relative 'card'
require_relative 'hand'

ORDER = %w(J 2 3 4 5 6 7 8 9 T Q K A).freeze

data = File.readlines('input.txt', chomp: true).map do |line|
  line.split(' ')
end

hands = data.map do |hand_string, bet_string|
  Hand.new(
    hand_string.chars.map { |value| Card.new(value, ORDER) }, 
    bet_string.to_i,
    use_joker: true
  )
end

# Sort by card values first
(0..4).reverse_each do |card_index|
  hands.sort_by! { |hand| hand[card_index].number }
end

# Sort by hand type
hands.sort_by!(&:type_number)

answer = hands.map.with_index(1) do |hand, rank|
  hand.bet * rank
end.sum

puts answer
