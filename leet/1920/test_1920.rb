require_relative '1920'
require_relative '../../utils'

require 'minitest/autorun'

class TestBuildArray < Minitest::Test
  def test_build_array_one
    assert_equal([0,1,2,4,5,3], build_array([0,2,1,5,3,4]))
  end

  def test_build_array_two
    assert_equal([4,5,0,1,2,3], build_array([5,0,1,2,3,4]))
  end
end