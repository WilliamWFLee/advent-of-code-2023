class SeedEnumerator
  include Enumerable

  def initialize(string)
    seed_data = string.split(':').last.strip.split(' ').map(&:to_i)
    @seed_ranges = seed_data.each_slice(2).map do |start, range|
      (start...start + range)
    end
  end

  def each
    @seed_ranges.each do |seed_range|
      seed_range.each do |seed|
        yield seed
      end
    end
  end
end
