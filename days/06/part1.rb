require_relative 'race'

times, records = File.readlines('input.txt').map do |line|
  line.split(':').last.strip.split(' ').map(&:to_i)
end
races = times.zip(records).map { |time, record| Race.new(time, record) }

puts races.map(&:possible_record_beating_times).reduce(:*)

