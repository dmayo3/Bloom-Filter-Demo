require "hash_functions.rb"
require "bit_vector.rb"

class BloomFilter

  def initialize(size, number_of_hashes)
    @vector = BitVector.new(size)
    @hash_functions = HashFunctions.new(number_of_hashes, size)
  end
  
  def add(word)
    @vector.set_bits(@hash_functions.compute_hashes(word.chomp))
  end
  
  def contains?(word)
    @vector.are_bits_set?(@hash_functions.compute_hashes(word.chomp))
  end
  
end

