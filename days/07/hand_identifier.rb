class HandIdentifier
  HANDS = %i(high_card one_pair two_pair three_of_a_kind full_house four_of_a_kind five_of_a_kind)

  def initialize(hand, card_values, use_joker: false)
    @hand = hand
    @card_values = card_values
    @use_joker = use_joker
  end

  def type
    hand_type = if has_count? 5
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
    elsif has_count? 1
      :high_card
    end

    @hand_type ||= (@use_joker ? add_jokers(hand_type) : hand_type)
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
      card_values = @use_joker ? (@card_values - ['J']) : @card_values 
      @values_count ||= card_values.reduce({}) do |h, value|
        count = @hand.count { |card| card.value == value }
        if count > 0
          h[count] ||= []
          h[count] << value
        end

        h
      end
    end

    def jokers
      unless @use_joker
        raise Exception.new('Joker flag has not been set')
      end
      @hand.card_values.count('J')
    end

    def add_jokers(hand_type)
      jokers_to_hand_type_map = {
        1 => {
          high_card: :one_pair,
          one_pair: :three_of_a_kind,
          two_pair: :full_house,
          three_of_a_kind: :four_of_a_kind,
          four_of_a_kind: :five_of_a_kind
        },
        2 => {
          high_card: :three_of_a_kind,
          one_pair: :four_of_a_kind,
          three_of_a_kind: :five_of_a_kind,
        },
        3 => {
          high_card: :four_of_a_kind,
          one_pair: :five_of_a_kind,
        },
        4 => {
          high_card: :five_of_a_kind,
        },
        5 => {
          nil => :five_of_a_kind
        }
      }

      hand_types_map = jokers_to_hand_type_map[self.jokers]
      return hand_type if hand_types_map.nil?

      hand_types_map[hand_type] || hand_type
    end
end
