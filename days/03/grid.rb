# Represents the schematic as an array of lines

class Grid
  include Enumerable

  def initialize(text)
    @arr = text.split("\n").map(&:strip)
  end

  def each(&block)
    @arr.each(&block)
  end

  def adjacent_to_symbol?(row, column)
    # Any character is adjacent to a symbol if any of the eight places
    # around has a symbol in it.
    (-1..1).any? do |row_diff|
      (-1..1).any? do |column_diff|
        offset_row = row + row_diff
        offset_column = column + column_diff
        if has_position?(offset_row, offset_column) && (row_diff != 0 || column_diff != 0)
          !@arr[offset_row][offset_column].match?(/\d+|\./)
        end
      end
    end
  end

  def has_position?(row, column)
    row >= 0 && row < @arr.length && column >= 0 && column < @arr.first.length
  end
end
