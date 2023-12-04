require_relative 'digit_finder'
require_relative 'grid'
require_relative 'symbol_finder'

DIGITS_REGEX = /\d+/

grid = Grid.new(File.read('input.txt'))
symbol_finder = SymbolFinder.new(grid)
digit_finder = DigitFinder.new(grid)

answer = digit_finder.findall
  .map.with_index do |matches, row|
    matches.map do |match|
      # Gets the start and end of each match
      start, end_ = match.offset(0)
      # Find all occurrences of * around it
      gears = (start...end_).map do |column|
        symbol_finder.findall_symbol(/\*/, row, column)
      end.reject(&:empty?).flatten.uniq
      [match, gears] unless gears.empty?
    end.compact
  end
  # Flatten to get an array of all numbers mapped to an array of positions of *s
  .flatten(1)
  # Produce a map of positions to how many numbers are adjacent to that position
  .reduce({}) do |m, (match, positions)|
    positions.each do |position|
      m[position] ||= []
      m[position] << match
    end

    m
  end
  # Discard any gears that do not have exactly two numbers next to them
  .filter do |position, matches|
    matches.length == 2
  end
  # Get the matches for each gear
  .map(&:last)
  # Convert the regexes matches to numbers and multiply them together
  .map do |row|
    row.map(&:to_s).map(&:to_i).reduce(:*)
  # Sum the results
  end.sum

puts answer.inspect
