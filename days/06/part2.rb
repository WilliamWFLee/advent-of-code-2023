require_relative 'race'

time, record = File.readlines('input.txt').map do |line|
  line.split(':').last.strip.split(' ').join.to_i
end
race = Race.new(time, record)

puts race.possible_record_beating_times

