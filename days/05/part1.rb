require_relative 'map'

def parse_seeds(string)
  string.split(':').last.strip.split(' ').map(&:to_i)
end

file = File.read('input.txt')

# Each section is divided by one blank, or two newline characters
sections = file.split("\n\n")

# The first section contaisn the seeds
seeds = parse_seeds(sections.first)
# The remaining sections contain the ranges
maps = sections[1..].map { |map_string| Map.from_string(map_string) }

# The ranges are in order in the file so we can pass the output of the last map
# as the input to the next map for each seed.
locations = seeds.map do |seed|
  maps.reduce(seed) do |prev_value, map|
    map.map(prev_value)
  end
end

answer = locations.min
puts answer
