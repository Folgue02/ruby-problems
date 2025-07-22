# You are given positive integers n and m.
# 
# Define two integers as follows:
#     num1: The sum of all integers in the range [1, n] (both inclusive) that are not divisible by m.
#     num2: The sum of all integers in the range [1, n] (both inclusive) that are divisible by m.
# 
# Return the integer num1 - num2.

# @param {Integer} n
# @param {Integer} m
# @return {Integer}
def difference_of_sums(n, m)
  num1 = (0..n)
    .filter { _1 % m != 0 }
    .sum
  num2 = (0..n)
    .filter { _1 % m == 0 }
    .sum

  num1 - num2
end