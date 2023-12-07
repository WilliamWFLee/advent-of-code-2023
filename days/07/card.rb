class Card
  VALUES = %w(2 3 4 5 6 7 8 9 T J Q K A)

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def number
    VALUES.index(@value)
  end
end
