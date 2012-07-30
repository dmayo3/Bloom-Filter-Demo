require "fnv"

# Generates multiple hashes for input words, each hash corresponds 
# to the index of a bit in a bit vector.
class HashFunctions

  # Params:
  # +number_of_hashes+:: the number of hashes to generate for each word
  # +maximum_output+:: the maximum number to be output by the hash functions
  def initialize(number_of_hashes, maximum_output)
    @fnv = FNV.new
    @number_of_hashes = number_of_hashes
    @maximum_output = maximum_output
  end
  
  # Compute all the hashes for the word provided
  #
  # +Returns+:: an array of numbers between 0 and +maximum_output+ (see constructor)
  def compute_hashes(word)
    # To simplify implementation, rather than use multiple hashing algorithms for
    # each hash, we just compute a 64-bit FNV hash and split it into smaller hashes.
    hash64 = @fnv.fnv1a_64(word)
    hashes = split_64_bit_hash(hash64)
    
    return hashes.map { |hash| hash % @maximum_output }
  end
  
  private
  # Splits a 64-bit hash into +@number_of_hashes+ parts.
  def split_64_bit_hash(hash64)
    bits_per_hash = 64 / @number_of_hashes
    bitmask = (1 << bits_per_hash) - 1
    
    results = Array.new
    
    @number_of_hashes.times do |i|
      hash = (hash64 >> (bits_per_hash * i)) & bitmask
      results.push(hash)
    end
    
    results
  end
  
end

