# This class can be used to represent a draw from the bag
# and what was put into the bag

class Collection < Struct.new(:red, :green, :blue)
  def self.from_string(string)
    red = string.match(/\d+(?= red)/).to_s.to_i
    green = string.match(/\d+(?= green)/).to_s.to_i
    blue = string.match(/\d+(?= blue)/).to_s.to_i

    Collection.new(red, green, blue)
  end

  # This can be used to compare a draw to what was put into the bag
  def <=(other)
    red <= other.red && green <= other.green && blue <= other.blue
  end
end

class Game
  attr_reader :id

  def initialize(string, bag)
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
end


bag = Collection.new(12, 13, 14)
answer = File.readlines('input.txt').map do |line|
  Game.new(line, bag)
end.filter(&:possible?).sum(&:id)

puts answer
