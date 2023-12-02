require_relative 'collection'

# Represents a single game with the draws that were made out of the bag
class Game
  attr_reader :id

  def initialize(string, bag: nil)
    @bag = bag
    # The ID is always before a colon
    @id = string.match(/\d+(?=\:)/).to_s.to_i
    # Split each draw after the colon, and make a 
    @collections = string[string.index(':') + 1..]
      .split(';')
      .map(&:strip)
      .map{ |string| Collection.from_string(string) }
  end

  def possible?
    @collections.all? { |collection| collection <= @bag }
  end

  def power
    # Iterate through each color and find the maximum number
    # of cubes drawn from all the draws of that color
    %i(red green blue).map do |color|
      @collections.map { |draw| draw.public_send(color) }.max
    end.reduce(:*)
  end
end
