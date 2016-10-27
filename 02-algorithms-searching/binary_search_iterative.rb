class Iterative
  attr_accessor :count

  def initialize
    @count = 0
  end

  def search(array, target)
    low = 0
    high = array.length - 1

    while low <= high
      @count += 1
      mid = (low + high) / 2

      if array[mid] < target
        low = mid + 1
      elsif array[mid] > target
        high = mid - 1
      else
        return mid
      end
    end
  end
end

# iterative = Iterative.new
# alphabets = ('A'..'Z').to_a
#
# puts iterative.search(alphabets, 'G')
# puts iterative.count
