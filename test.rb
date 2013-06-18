require 'code'

class FooTest < Test::Unit::TestCase
  test 'can specify a food time' do
    assert_equal 'lunch', Saturday.availability(:food, 'b')
  end

  test 'can specify a mahjong time' do
    assert_equal 'after supper 6pm until whenever', Saturday.availability(:mahjong, 'e')
  end

  test 'can specify both a mahjong time and a food time' do
    assert_equal 'lunch, supper', Saturday.availability(:food, 'b,d')
  end

  test 'can receive a summary of all events for Saturday if food and game options are chosen' do
    alistair_response = 'b,e'
    expected = "Alistair is available for\nfood at these times: lunch\nmahjong at these times: after supper 6pm until whenever\n"

    assert_equal expected, Saturday.when?(alistair_response)
  end

  test 'can receive a summary of all events for Saturday if only food options are chosen' do
    alistair_response = 'b'
    expected = "Alistair is available for\nfood at these times: lunch\nmahjong at these times: \n"
    assert_equal expected, Saturday.when?(alistair_response)
  end
end
