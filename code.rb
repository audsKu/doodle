TIMESLOTS = {
  'a' => 'in the morning',
  'b' => 'lunch',
  'c' => 'after lunch 1-5pm',
  'd' => 'supper',
  'e' => 'after supper 6pm until whenever'
}

ACTIVITIES = {
  :food => %w(b d),
  :mahjong => %w(a c e)
}

class Saturday
  def self.when? (options = {})
    schedule = "Alistair is available for\n"
    schedule << "a game in these times: #{options[:game_time]}\n" if options[:game_time]
    schedule << "some good food at these times: #{options[:yum_time]} " if options[:yum_time]
    schedule << "none of these time" if !options[:game_time] && !options[:yum_time]
    schedule
  end
end

def availability(activity, response)
  response.split(',').map { |choice| TIMESLOTS[choice] }.join(', ')
end

if __FILE__ == $0
  options = TIMESLOTS.keys.join(',')
  print "Pick all that apply (#{options}. Are you available"
  TIMESLOTS.each_pair do |choice, description|
    print "(#{choice}) #{description}"
  end

  alistair_response = gets.chomp
  Saturday.when?(alistair_response)
end
