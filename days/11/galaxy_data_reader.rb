require_relative 'galaxy'
require 'byebug'

class GalaxyDataReader
  def initialize(data)
    @data = data
  end

  def galaxies
    process_text
    @galaxies ||= find_galaxies
  end

  def empty_columns
    @empty_columns ||= (0...@arr.first.length).map do |col_index|
      col_index if @arr.all? { |row| row[col_index] == '.' }
    end.compact
  end

  def empty_rows
    @empty_rows = @arr.map.with_index do |row, i|
      i if row.all? { |char| char == '.' }
    end.compact
  end

  private

    def process_text
      @arr = @data.split("\n").map(&:strip).map(&:chars)
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