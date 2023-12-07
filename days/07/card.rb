class Card
  attr_reader :value

  def initialize(value, order)
    @value = value
    @order = order
  end

  def number
    @order.index(@value)
  end
end
