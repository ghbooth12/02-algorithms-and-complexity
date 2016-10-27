class Recursive
  attr_accessor :count
  attr_accessor :origin

  def initialize(array)
    @count = 0
    @origin = (0..array.length - 1).to_a
  end
  # Array is eight items long
  # index = 0
  # Each recursive call either adds log (base 2) n indices
  # or subtracts log (base 2) n indices
  # Example: assume value is in last position of array
  # First recusive call splits the array in two halves and the "right" # half is used. We know that the index must be greater than  array.size / 2
  def search(array, target)
    low = 0
    high = array.length - 1

    if low <= high
      @count += 1
      mid = (low + high) / 2
      if array[mid] < target # Right Half
        @origin = @origin[mid+1..-1]
        search(array[mid+1..-1], target)
      elsif array[mid] > target # Left Half
        @origin = @origin[0..mid-1]
        search(array[0..mid-1], target)
      else
        @origin = @origin[mid]
        return array[mid]
      end
    end
  end
end

# f(n - 1): this guy needs the same set of variables and the operating system has to allocate space for every variable since it's a new call stack (slow)
# f(n) = f(n - 1) + f(n - 2) (think of this as "one call"); this "call" has a bunch of variables like @index and target.


# Searching for two:
# First iteration:  | 1 | 2 | 3 | 4 | 5 | 6 |, @index = 6
# Second iteration: | 1 | 2 | 3 |, @index = 3 (subtracted 3)
# Third iteration:  | 1 | 2 |, @index = 2 (subtract 1)
# Three recursive calls

# First iteration:  | 1 | 2 | 3 | 4 | 5 | 6 |, @index = 6
# Second iteration: | 4 | 5 | 6 |, @index = 6
# Third iteratin:   | 5 | 6 |, @index = 6
# Fourth iteratin:  | 6 |, @index = 6
# Four recursive calls

alphabets = ('A'..'Z').to_a
recursive = Recursive.new(alphabets)

puts recursive.search(alphabets, 'G') # 6
# puts recursive.count
puts recursive.origin
