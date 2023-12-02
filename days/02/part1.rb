require_relative 'game'
require_relative 'collection'

bag = Collection.new(12, 13, 14)
answer = File.readlines('input.txt').map do |line|
  Game.new(line, bag)
end.filter(&:possible?).sum(&:id)

puts answer
