require_relative 'sequence'

sequences = File.readlines('input.txt', chomp: true).map do |line|
  Sequence.new(line.split(' ').map(&:to_i))
end

answer = sequences.sum(&:next)

puts answer
