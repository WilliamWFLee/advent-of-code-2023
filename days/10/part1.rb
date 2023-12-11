require_relative 'grid'
require_relative 'cell'

cells = File.readlines('input.txt', chomp: true).map do |line|
  line.chars.map { |letter| Cell.new(letter) }
end
grid = Grid.new(cells)
puts grid.max_distance_from_start
