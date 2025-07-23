require_relative '2807'
require_relative '../../utils'

require 'minitest/autorun'

class TestInsertGreatestCommonDivisor < Minitest::Test
  def test_insert_greatest_common_divisor
    input = ListNode.of_array([18,    6,    10,    3])
    expected =                [18, 6, 6, 2, 10, 1, 3]

    assert_equal(expected, insert_greatest_common_divisors(input))
  end

  def test_insert_greatest_common_divisor_one_element
    input = ListNode.of_array([7])
    expected =                [7]

    assert_equal(expected, insert_greatest_common_divisors(input))
  end

  def test_insert_greatest_common_divisor_two_element
    input = ListNode.of_array([18,    16])
    expected =                [18, 2, 16]

    assert_equal(expected, insert_greatest_common_divisors(input))
  end
end