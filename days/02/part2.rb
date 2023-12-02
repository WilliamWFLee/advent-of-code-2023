require_relative 'game'

answer = File.readlines('input.txt').map do |line|
  Game.new(line)
end.sum(&:power)

puts answer
