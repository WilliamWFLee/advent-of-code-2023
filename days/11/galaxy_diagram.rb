class GalaxyDiagram
  def initialize(galaxies, empty_rows, empty_columns, empty_multiplier: 2)
    @galaxies = galaxies
    @empty_rows = empty_rows
    @empty_columns = empty_columns
    @empty_multiplier = empty_multiplier
  end

  def distance_sum
    @galaxies.combination(2).sum do |galaxy1, galaxy2|
      self.galaxy_distance(galaxy1, galaxy2)
    end
  end

  private

    def galaxy_distance(galaxy1, galaxy2)
      dx = (galaxy1.x - galaxy2.x).abs
      dy = (galaxy1.y - galaxy2.y).abs

      dx += (@empty_multiplier - 1) * @empty_columns.count do |col_index|
        Range.new(*[galaxy1.x, galaxy2.x].sort).include?(col_index)
      end
      dy += (@empty_multiplier - 1) * @empty_rows.count do |row_index|
        Range.new(*[galaxy1.y, galaxy2.y].sort).include?(row_index)
      end

      dx + dy
    end
end
