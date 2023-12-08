require_relative 'steps_calculator'
require_relative 'input_loader'

instructions, graph = InputLoader.new.load

answer = StepsCalculator.new(graph, instructions)
  .calculate_steps('AAA') do |node|
    node == 'ZZZ'
  end

puts answer
