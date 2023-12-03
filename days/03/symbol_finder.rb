class SymbolFinder
  def initialize(grid)
    @grid = grid
  end

  def adjacent_to_symbol?(row, column)
    # Any character is adjacent to a symbol if any of the eight places
    # around has a symbol in it.
    (-1..1).any? do |row_diff|
      (-1..1).any? do |column_diff|
        offset_row = row + row_diff
        offset_column = column + column_diff
        if @grid.has_position?(offset_row, offset_column) && (row_diff != 0 || column_diff != 0)
          !@grid[offset_row][offset_column].match?(/\d+|\./)
        end
      end
    end
  end
end
