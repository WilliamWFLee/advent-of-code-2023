require_relative 'hand_identifier'

class Hand
  include Enumerable

  attr_reader :bet

  def initialize(cards, bet, use_joker: false)
    @cards = cards
    @bet = bet
    @use_joker = use_joker
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

  def type
    identifier.type
  end

  def type_number
    identifier.number
  end

  private

    def identifier
      @identifier ||= HandIdentifier.new(self, ORDER, use_joker: @use_joker)
    end
end
