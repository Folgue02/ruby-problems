# @param {String[]} words
# @param {Character} x
# @return {Integer[]}
def find_words_containing(words, x)
  indexes = []
  words.each.with_index do |word, w_index|
    indexes << w_index if word.include?(x)
  end 
  indexes
end