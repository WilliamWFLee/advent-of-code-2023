require_relative 'galaxy_data_reader'
require_relative 'galaxy_diagram'

data = File.read('input.txt')
reader = GalaxyDataReader.new(data)
image = GalaxyDiagram.new(reader.galaxies)
puts image.distance_sum
