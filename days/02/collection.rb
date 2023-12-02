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
