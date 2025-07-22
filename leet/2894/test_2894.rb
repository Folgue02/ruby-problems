require_relative '2894'
require_relative '../../utils'

require 'minitest/autorun'

class TestDifferenceOfSums < Minitest::Test
  def test_diff_of_sums_a
    assert_equal(19, difference_of_sums(10, 3))
  end

  def test_diff_of_sums_b
    assert_equal(15, difference_of_sums(5, 6))
  end
end