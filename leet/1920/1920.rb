# Given a zero-based permutation nums (0-indexed), build an array ans of the same 
# length where ans[i] = nums[nums[i]] for each 0 <= i < nums.length and return it.

# @param {Integer[]} nums
# @return {Integer[]}
def build_array(nums)
  result = Array.new(nums.max)
  nums.each.with_index do |num, n_index|
    result[n_index] = nums[num]
  end

  result
end