require_relative 'direction'
require_relative 'grid_array'

class Grid
  def initialize(cells)
    @cells = cells
  end

  def max_distance_from_start
    distance_map.map do |row|
      row&.compact&.max || 0
    end.compact.max
  end

  def count_cells_within_loop
    loop_neighbour_map.map do |row|
      row.count { |value| value == 4 }
    end.sum
  end

  private

    def distance_map
      @distance_map ||= construct_distance_map
    end

    def loop_neighbour_map
      @loop_neighbour_map ||= construct_loop_neighbour_map
    end

    def construct_distance_map
      distance_map = GridArray.new
      distance_map[self.start.last] = 0

      cell_stack = [[self.start, 0]]
      until cell_stack.empty?
        cell_data, distance_from_start = cell_stack.pop
        cell, coords = cell_data

        cell.accessible_directions.each do |direction|
          direction_vector = Direction.vector(direction)
          adjacent_coords = coords.zip(direction_vector).map(&:sum)
          adjacent_cell = cell_at(*adjacent_coords)
          next if adjacent_cell.nil?
          debugger if adjacent_coords == [3, 3]
          if distance_map[adjacent_coords].nil? && adjacent_cell.accessible?(from: (direction + 2) % 4)
            incremented_distance = distance_from_start + 1
            distance_map[adjacent_coords] = incremented_distance
            cell_stack.insert(0, [[adjacent_cell, adjacent_coords], incremented_distance])
          end
        end
      end

      distance_map
    end

    def construct_loop_neighbour_map
      @cells.map do |row|
        row.map do |cell|
          if cell.ground?
            (0..3).sum do |direction|
              
            end
          else
            -1
          end
        end
      end
    end

    def start
      @start ||= @cells.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          return [cell, [y, x]] if cell.start?
        end
      end
    end

    def cell_at(y, x)
      @cells.fetch(y, [])[x]
    end
end
