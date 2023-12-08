class InputLoader
  def initialize(filename = 'input.txt')
    @filename = filename
  end

  def load
    lines = File.readlines(@filename, chomp: true)

    instructions = lines.first.chars.cycle
    graph = lines[2..].map do |line|
      node, edges = line.split('=').map(&:strip)
      left, right = edges[1..-2].split(', ')
      [node, [left, right]]
    end.to_h

    [instructions, graph]
  end
end
