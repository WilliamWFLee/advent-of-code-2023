class Card
  attr_reader :winning_numbers, :card_values

  def initialize(winning_numbers, card_values)
    @winning_numbers = winning_numbers
    @card_values = card_values
  end

  def self.from_string(string)
    card_part = string.split(':').last.strip
    winning_numbers, card_values = card_part
      .split('|')
      .map do |values|
        values.split(' ')
      end

    self.new(winning_numbers, card_values)
  end

  def score
    if num_winning_numbers > 0
      2 ** (num_winning_numbers - 1)
    else
      0
    end
  end

  def num_winning_numbers
    @num_winning_numbers ||= winning_numbers.count do |winning_number|
      card_values.include? winning_number
    end
  end

  def clone
    self.class.new(@winning_numbers, @card_values)
  end
end