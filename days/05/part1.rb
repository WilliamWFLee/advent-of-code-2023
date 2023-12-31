require_relative 'map'
require_relative 'seed_mapper'

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

puts SeedMapper.new(seeds, maps).closest_location
