class SeedMapper

  def initialize(seeds, maps)
    @seeds = seeds
    @maps = maps
  end

  def closest_location
    locations.min
  end

  private

    def locations
      # The ranges are in order in the file so we can pass the output of the last map
      # as the input to the next map for each seed.
      @seeds.map do |seed|
        @maps.reduce(seed) do |prev_value, map|
          map.map(prev_value)
        end
      end
    end
end