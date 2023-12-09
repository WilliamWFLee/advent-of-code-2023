class Sequence
  def initialize(numbers)
    @numbers = numbers
    calculate_subsequences
  end

  def next
    current_difference = linear_difference
    @subsequences[..-3].reverse.each do |sequence|
      current_difference = sequence.last + current_difference
    end

    current_difference
  end

  def prev
    current_difference = linear_difference
    @subsequences[..-3].reverse.each do |sequence|
      current_difference = sequence.first - current_difference
    end

    current_difference
  end

  private

    def linear_difference
      @subsequences[-2].first
    end

    def calculate_subsequences
      @subsequences = [@numbers]
      until @subsequences.last.all?(&:zero?)
        current_subsequence = @subsequences.last
        @subsequences << current_subsequence[..-2]
          .zip(current_subsequence[1..])
          .map { |a, b| b - a }
      end
    end
end
