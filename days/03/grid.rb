# Represents the schematic as an array of lines

class Grid
  include Enumerable

  def initialize(text)
    @arr = text.split("\n").map(&:strip)
  end

  def each(&block)
    @arr.each(&block)
  end

  def [](row)
    @arr[row]
  end

  def has_position?(row, column)
    row >= 0 && row < @arr.length && column >= 0 && column < @arr.first.length
  end
end
