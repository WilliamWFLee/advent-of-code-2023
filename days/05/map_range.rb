# We can just use the destination range start and the range start
# to work out the offset to get from the source to the destination
# and the start and end of the source range

class MapRange
  def initialize(dest_range_start, src_range_start, range)
    @src_range_start = src_range_start
    @src_to_dest_offset = dest_range_start - src_range_start
    @src_range_end = src_range_start + range - 1
  end

  def in_range?(src_value)
    @src_range_start <= src_value && src_value <= @src_range_end
  end

  # Only return a value if the source value is within range
  def map(src_value)
    if in_range?(src_value)
      src_value + @src_to_dest_offset
    end
  end

  def self.from_string(string)
    self.new(*string.split(' ').map(&:to_i))
  end
end
