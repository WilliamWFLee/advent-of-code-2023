class StepsCalculator
  def initialize(graph, instructions)
    @graph = graph
    @instructions = instructions
  end

  def calculate_steps(start)
    current_node = start
    @instructions.take_while do |instruction|
      if (yield current_node)
        false
      else
        current_node = if instruction == 'L'
          @graph[current_node].first
        else
          @graph[current_node].last
        end
        true
      end
    end.count
  end
end