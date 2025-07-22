require_relative '3110'
require_relative '../../utils'

require 'minitest/autorun'

class TestScoreString < Minitest::Test
  def test_score_string_hello
    assert_equal(13, score_of_string(Utils::read_input('hello')))
  end

  def test_score_string_hello
    assert_equal(50, score_of_string(Utils::read_input('zaz')))
  end
end