require_relative 'position'

class SymbolFinder
  def initialize(grid)
    @grid = grid
  end

  def findall_symbol(re, row, column)
    # Fetches all the symbols around a digit
    (-1..1).map do |row_diff|
      (-1..1).map do |column_diff|
        find_symbol(re, row, row_diff, column, column_diff)
      end
    end.flatten.compact
  end

  def adjacent_to_any_symbol?(row, column)
    # Any character is adjacent to a symbol if any of the eight places
    # around has a symbol in it.
    (-1..1).any? do |row_diff|
      (-1..1).any? do |column_diff|
        !find_symbol(/^(?!\d|\.)/, row, row_diff, column, column_diff).nil?
      end
    end
  end

  private

    def find_symbol(re, row, row_diff, column, column_diff)
      offset_row = row + row_diff
      offset_column = column + column_diff
      if @grid.has_position?(offset_row, offset_column) && (row_diff != 0 || column_diff != 0)
        match = @grid[offset_row][offset_column].match(re)
        unless match.nil?
          Position.new(offset_row, offset_column)
        end
      end
    end
end
