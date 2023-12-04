require_relative 'digit_finder'
require_relative 'grid'
require_relative 'symbol_finder'

DIGITS_REGEX = /\d+/

grid = Grid.new(File.read('input.txt'))
symbol_finder = SymbolFinder.new(grid)
digit_finder = DigitFinder.new(grid)
# Find the start and end of all digits on each line
answer = digit_finder.findall
  .map.with_index do |matches, row|
    # Matches are filtered by whether they have a symbol adjacent
    matches.filter do |match|
      # Gets the start and end of each match
      start, end_ = match.offset(0)
      # A number is included if at least one of its digits is adjacent
      # to a symbol that is not a dot or a digit
      (start...end_).any? do |column|
        symbol_finder.adjacent_to_any_symbol?(row, column)
      end
    end
  end
  # Flatten by one level to get all matches in the whole schematic
  .flatten(1)
  # Convert to integers and sum
  .map(&:to_s).map(&:to_i).sum

puts answer
