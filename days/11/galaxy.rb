class Galaxy
  attr_reader :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end

  def taxicab_distance(other)
    (self.x - other.x).abs + (self.y - other.y).abs
  end
end
