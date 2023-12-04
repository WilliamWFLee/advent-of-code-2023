require_relative 'digit_finder'

class DigitFinder
  def initialize(grid)
    @grid = grid
  end

  def findall
    @grid.map do |line|
      # Looks for digits by regex and returns the matches
      line.to_enum(:scan, DIGITS_REGEX).map{$~}
    end
  end
end