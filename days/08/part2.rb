require_relative 'steps_calculator'
require_relative 'input_loader'

instructions, graph = InputLoader.new.load

nodes = graph.keys.filter { |node| node.end_with? 'A' }
steps_for_each_node = nodes.map do |node|
  StepsCalculator.new(graph, instructions).calculate_steps(node) do |node|
    node.end_with? 'Z'
  end
end

answer = steps_for_each_node.reduce(:lcm)
puts answer
