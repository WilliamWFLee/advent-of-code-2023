require_relative 'grid'

DIGITS_REGEX = /\d+/

grid = Grid.new(File.read('input.txt'))

# Find the start and end of all digits on each line
answer = grid.map do |line|
  # Looks for digits by regex and returns the matches
  line.to_enum(:scan, DIGITS_REGEX).map{$~}
end.map.with_index do |matches, row|
  # Matches are filtered by whether they have a symbol adjacent
  matches.filter do |match|
    # Gets the start and end of each match
    start, end_ = match.offset(0)
    # A number is included if at least one of its digits is adjacent
    # to a symbol that is not a dot or a digit
    (start...end_).any? do |column|
      grid.adjacent_to_symbol?(row, column)
    end
  end
end
# Flatten by one level to get all matches in the whole schematic
.flatten(1)
# Convert to integers and sum
.map(&:to_s).map(&:to_i).sum

puts answer
