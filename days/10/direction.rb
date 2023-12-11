class Direction
  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def self.vector(direction)
    case direction
    when NORTH
      [-1, 0]
    when EAST
      [0, 1]
    when SOUTH
      [1, 0]
    when WEST
      [0, -1]
    end
  end
end
