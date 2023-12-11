class GridArray
  include Enumerable

  def initialize
    @arr = []
  end

  def [](coords)
    y, x = coords
    @arr[y] ||= []
    @arr[y][x]
  end

  def []=(coords, value)
    y, x = coords
    @arr[y] ||= []
    @arr[y][x] = value
  end

  def each(&block)
    @arr.each(&block)
  end
end