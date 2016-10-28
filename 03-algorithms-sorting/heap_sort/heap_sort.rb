require_relative 'max_binary_heap'

class HeapSort
  attr_accessor :heap
  
  def initialize
    @heap = MaxBinaryHeap.new
  end

  # This method prepends the root of @heap into 'sorted' array.
  # The root of @heap has the largest value.
  def heap_sort(array)
    sorted = []
    build_heap(array)

    # If sorted.length == array.length, there is nothing in @heap.
    # @heap.deleteRoot returns the root that just got removed.
    while sorted.length < array.length
      sorted.unshift(@heap.deleteRoot)
    end

    sorted
  end

  # This method builds a MAX binary heap.
  def build_heap(array)
    for el in array
      @heap.insert(el)
    end
  end
end
