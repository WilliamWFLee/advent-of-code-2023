class GalaxyDiagram
  def initialize(galaxies)
    @galaxies = galaxies
  end

  def distance_sum
    @galaxies.combination(2).sum do |galaxy1, galaxy2|
      galaxy1.taxicab_distance(galaxy2)
    end
  end
end
