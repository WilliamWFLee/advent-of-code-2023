require_relative 'map'
require_relative 'seed_mapper'
require_relative 'seed_enumerator'

file = File.read('input.txt')

# Each section is divided by one blank, or two newline characters
sections = file.split("\n\n")

# The first section contains the seeds
seeds = SeedEnumerator.new(sections.first)
# The remaining sections contain the ranges
maps = sections[1..].map { |map_string| Map.from_string(map_string) }

puts SeedMapper.new(seeds, maps).closest_location
