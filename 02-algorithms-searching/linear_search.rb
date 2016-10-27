class Linear
  attr_accessor :count

  def initialize
    @count = 0
  end

  def search(array, target)
    @count = 0
    for el in array
      @count += 1
      if el == target
        return array.index(el)
      end
    end
  end
end

# linear = Linear.new
# alphabets = ('A'..'Z').to_a
#
# puts linear.search(alphabets, 'G')
# puts linear.count
