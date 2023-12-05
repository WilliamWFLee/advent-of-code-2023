require_relative 'card'

scores = File.readlines('input.txt').map do |line|
  Card.from_string(line).num_winning_numbers
end

card_counts = [1] * scores.length
scores.each_with_index do |score, i|  
  (1..score).each do |offset|
    card_counts[i + offset] += card_counts[i] if i + offset < scores.length
  end
end

answer = card_counts.flatten.sum
puts answer
