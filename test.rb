require 'code'

class FooTest < Test::Unit::TestCase
  test 'can specify a food time' do
    assert_equal 'for lunch', FoodTime.new('b').schedule
  end

  test 'can specify a mahjong time' do
    assert_equal 'in the evening', MahJongTime.new('e').schedule
  end

  test 'can specify both a mahjong time and a food time' do
    assert_equal 'in the evening', MahJongTime.new('b,e').schedule
    assert_equal 'for lunch', FoodTime.new('b,e').schedule
  end

  test 'can receive a summary of all events for Saturday if food and game options are chosen' do
    alistair_response = 'b,e'
    @game_time = MahJongTime.new(alistair_response)
    @yum_time = FoodTime.new(alistair_response)

    expected = 'Alistair is available fora game in these times, in the evening some good food at these times, for lunch '
    assert_equal expected, Saturday.when?(:game_time => @game_time, :yum_time => @yum_time)
  end

  test 'can receive a summary of all events for Saturday if only food options are chosen' do
    alistair_response = 'b'
    @game_time = MahJongTime.new(alistair_response)
    @yum_time = FoodTime.new(alistair_response)

    expected = 'Alistair is available forsome good food at these times, for lunch '
    assert_equal expected, Saturday.when?(:game_time => @game_time, :yum_time => @yum_time)
  end

end
