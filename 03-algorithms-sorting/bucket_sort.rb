require_relative 'insertion_sort'

class BucketSort
  attr_accessor :buckets

  # This method visits the buckets in order and put all elements into the array and return it.
  def bucket_sort(array)
    fill_bucket(array)
    insertion_sorting
    sorted = []
    for bucket in @buckets
      unless bucket.nil?
        sorted += bucket
      end
    end
    sorted
  end

  # This method sets up buckets and distributes each item into the proper bucket according to its value.
  def fill_bucket(array)
    size = array.length
    max_item = find_max(array)
    divider = (max_item.ord + 1) / size # 'ord' returns the integer ordinal of a one-character string
    @buckets = Array.new

    for el in array
      index = el.ord / divider
      if @buckets[index].nil?
        @buckets[index] = []
      end
      @buckets[index] << el
    end
  end

  # This method finds the largest item in the given array
  def find_max(array)
    max = array[0]
    for i in 1...array.length
      if max < array[i]
        max = array[i]
      end
    end
    max
  end

  # This method sorts each non-empty bucket in @buckets using 'insertion_sort' algorithms
  def insertion_sorting
    sort = InsertionSort.new
    for i in 0...@buckets.length
      unless @buckets[i].nil?
        @buckets[i] = sort.insertion_sort(@buckets[i])
      end
    end
  end
end
