class Race
  def initialize(time, record)
    @time = time
    @record = record
  end

  def possible_record_beating_times
    (0..).each do |press_time|
      distance = press_time * (@time - press_time)
      if distance > @record
        return (@time + 1) - 2 * press_time
      end
    end
  end
end
