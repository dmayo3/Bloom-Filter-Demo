# A small demo program that estimates the number of unique words in a work of 
# fiction (in this case 'The Shunned House' by H.P. Lovecraft). It uses a
# simple bloom filter implementation. Bloom filters can determine set
# membership within a small amount of memory. False positives are possible, but
# it's possible to trade off between memory and accuracy.
#
# Author: Daniel Mayo

require "rubygems"
require "bundler/setup"

require "bloom_filter.rb"

filter_size = 8000
number_of_hashes = 4

filter = BloomFilter.new(filter_size, number_of_hashes)
unique_word_set = Set.new

puts "Counting the words in 'The Shunned House' by H.P. Lovecraft..."

unique_words_estimate = 0
total_words = 0
File.new("the-shunned-house-by-hp-lovecraft.txt", 'r').each_line do |word|
  total_words += 1
  unique_words_estimate += 1 unless filter.contains?(word)
  
  filter.add(word)
  unique_word_set.add(word)
end

puts "Total words: #{total_words}"
puts "Estimated number of unique words (determined using a bloom filter): #{unique_words_estimate}"
puts "Actual number of unique words (determined using a standard Set datastructure): #{unique_word_set.size}"

accuracy = (unique_words_estimate.to_f / unique_word_set.size) * 100
puts "Bloom filter has achieved accuracy of ~#{accuracy.to_i}% using #{filter_size/(8)} bytes of space and #{number_of_hashes} hashes"

set_memory_estimate = unique_word_set.inject(0) { |count,word| count + word.bytes.to_a.size }
puts "...compared to more than #{set_memory_estimate} bytes required to hold all the unique words in a set"

