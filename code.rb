class Saturday
  def self.when? (options = {})
    schedule = "Alistair is available for"
    schedule << "a game in these times, #{options[:game_time].schedule} " if options[:game_time].schedule != ''
    schedule << "some good food at these times, #{options[:yum_time].schedule} " if options[:yum_time].schedule != ''
    schedule << "none of these time" if !options[:game_time] && !options[:yum_time]
    schedule
  end
end

class GoodTime
  def initialize(response)
    @response = response.split(',')
  end

  def schedule
    available_time.select { |key, value|
      @response.include? key
    }.
      values.
      join(",")
  end

  private
    def available_time
      raise NotImplementedError
    end
end

class MahJongTime < GoodTime
  private
  def available_time
    {
     'a' => 'in the morning',
     'c' => 'in the afternoon',
     'e' => 'in the evening'
    }
  end
end

class FoodTime < GoodTime
  private
  def available_time
    {
     'b' => 'for lunch',
     'd' => 'for supper'
    }
  end
end

if __FILE__ == $0
  print "Pick all that apply (a,b,c,d,or e). Are you available
  (a) in the morning
  (b) for lunch
  (c) after lunch 1-5pm
  (d) for supper
  (e) after supper 6-whenever"

  alistair_response = gets.chomp
  @game_time = MahJongTime.new(alistair_response)
  @yum_time = FoodTime.new(alistair_responses)
  Saturday.when? :game_time => @game_time, :yum_time => @yum_time
end
