# Completely unoptimized bit vector (simply an array of booleans)
class BitVector < Array

  def initialize(size)
    super(size)
    fill(false)
  end
  
  def set_bits(indexes)
    indexes.each { |index| self[index] = true }
  end
  
  def are_bits_set?(indexes)
    indexes.each do |index|
      return false unless self[index]
    end
    
    return true
  end
  
end

