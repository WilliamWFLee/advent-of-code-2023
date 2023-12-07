require_relative 'card'

class HandIdentifier
  HANDS = %i(high_card one_pair two_pair three_of_a_kind full_house four_of_a_kind five_of_a_kind)

  def initialize(hand)
    @hand = hand
  end

  def type
    @hand_type ||= if has_count? 5
      :five_of_a_kind
    elsif has_count? 4
      :four_of_a_kind
    elsif has_count? 3
      if has_count? 2
        :full_house
      else
        :three_of_a_kind
      end
    elsif has_count? 2
      if values_count[2].length == 2
        :two_pair
      else
        :one_pair
      end
    else
      :high_card
    end
  end

  def number
    HANDS.index(type)
  end

  private

    def has_count?(count)
      values_count.keys.include?(count)
    end

    def values_count
      # Maps the number of cards to the card values with that number of cards
      @values_count ||= Card::VALUES.reduce({}) do |h, value|
        count = @hand.count { |card| card.value == value }
        if count > 0
          h[count] ||= []
          h[count] << value
        end

        h
      end
    end
end
