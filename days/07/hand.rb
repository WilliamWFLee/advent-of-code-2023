class Hand
  include Enumerable

  attr_reader :bet

  def initialize(cards, bet)
    @cards = cards
    @bet = bet
  end

  def card_values
    @cards.map(&:value)
  end

  def each(&block)
    @cards.each(&block)
  end 

  def [](index)
    @cards[index]
  end

  def to_s
    @cards.map(&:value).join
  end
end
