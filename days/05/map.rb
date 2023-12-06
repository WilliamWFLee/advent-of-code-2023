require_relative 'map_range'

class Map
  def initialize(map_ranges)
    @map_ranges = map_ranges
  end

  # Iterate over each map range until a value is returned from one of the
  # ranges, or the list is exhausted and the input value is returned.
  def map(src_value)
    dest_value = @map_ranges
      .lazy.map { |map_range| map_range.map(src_value) }
      .find { |value| !value.nil? }
    dest_value.nil? ? src_value : dest_value
  end

  def self.from_string(string)
    heading, *ranges = string.split("\n")
    map_ranges = ranges.map { |range_string| MapRange.from_string(range_string) }

    self.new(map_ranges)
  end
end
