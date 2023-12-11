require_relative 'galaxy'
require 'byebug'

class GalaxyDataReader
  def initialize(data)
    @data = data
  end

  def galaxies
    @galaxies ||= begin
      process_text
      expand_empty_columns
      expand_empty_rows
      find_galaxies
    end
  end

  private

    def process_text
      @arr = @data.split("\n").map(&:strip).map(&:chars)
    end

    def expand_empty_columns
      cols_to_expand = []
      (0...@arr.first.length).each do |col_index|
        if @arr.all? { |row| row[col_index] == '.' }
          cols_to_expand << col_index
        end
      end

      cols_to_expand.each_with_index do |col_index, offset|
        @arr.each do |row|
          row.insert(col_index + offset, '.')
        end
      end
    end

    def expand_empty_rows
      @arr = @arr.map do |row|
        if row.all? { |char| char == '.' }
          [[row.clone]] * 2
        else
          [[row]]
        end
      end.flatten(2)
    end

    def find_galaxies
      @arr.map.with_index do |row, y|
        row.map.with_index do |cell, x|
          if cell == '#'
            Galaxy.new(x, y)
          end
        end
      end.flatten.compact
    end
end