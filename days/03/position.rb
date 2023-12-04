class Position
  attr_reader :char

  def initialize(row, column)
    @row = row
    @column = column
  end

  def position
    [@row, @column]
  end

  def ==(other)
    self.class == other.class && self.position == other.position
  end

  alias eql? ==

  def hash
    @row.hash ^ @column.hash
  end
end
