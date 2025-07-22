# You are given a string s. The score of a string is defined as the sum of 
# the absolute difference between the ASCII values of adjacent characters.

# @param {String} s
# @return {Integer}
def score_of_string(s)
  score = 0 
  (0...s.length - 1).each do |c_index|
    score += (s[c_index].ord - s[c_index + 1].ord).abs
  end

  score
end
