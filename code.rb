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
  def self.when?(response)
    schedule =  "=================================\n\n"
    schedule << "Alistair, you are available for\n"
    ACTIVITIES.keys.each do |activity|
      availability = availability(activity, response)
      schedule << "#{activity} at these times: #{availability}\n" if availability
    end
    schedule
  end

  private
    def self.availability(activity, response)
      availability = response.split(',').map do |choice|
        if ACTIVITIES[activity].include?(choice)
          TIMESLOTS[choice]
        end
      end
      availability.delete_if(&:nil?).join(', ')
    end
end

if __FILE__ == $0
  options = TIMESLOTS.keys.join(',')
  print "Pick all that apply (#{options}). Are you available\n"
  TIMESLOTS.each_pair do |choice, description|
    print "(#{choice}) #{description} \n"
  end
  print "Enter your choice here: "
  alistair_response = gets.chomp
  print Saturday.when?(alistair_response)
end
