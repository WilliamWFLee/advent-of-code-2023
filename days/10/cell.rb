class Cell
  def initialize(letter)
    @letter = letter
  end

  def accessible?(from:)
    accessibility_map[from]
  end

  def accessible_directions
    (0..3).filter { |i| accessibility_map[i] }
  end

  def start?
    @letter == 'S'
  end

  def ground?
    @letter == '.'
  end

  private

    def accessibility_map
      # Order: north, east, south, west
      @accessibility_map ||= case @letter
        when '|'
          [true, false, true, false]
        when '-'
          [false, true, false, true]
        when 'L'
          [true, true, false, false]
        when 'J'
          [true, false, false, true]
        when '7'
          [false, false, true, true]
        when 'F'
          [false, true, true, false]
        when 'S'
          [true, true, true, true]
        when '.'
          [false, false, false, false]
        end
    end
end
