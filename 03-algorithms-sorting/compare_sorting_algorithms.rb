require 'benchmark'
require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'heap_sort/heap_sort'
require_relative 'bucket_sort'

class SortingAlgos
  def create_array
    array = []
    50.times { array << random_word }
    array
  end

  def random_word
    alphabets = ('a'..'z').to_a
    alphabets.sample(3).join
  end

  def insertion_sort_time(array)
    time = Benchmark.realtime do
      ins = InsertionSort.new
      ins.insertion_sort(array)
    end
    puts "Insertion Sort Time: #{time} seconds"
  end

  def selection_sort_time(array)
    time = Benchmark.realtime do
      sel = SelectionSort.new
      sel.selection_sort(array)
    end
    puts "Selection Sort Time: #{time} seconds"
  end

  def bubble_sort_time(array)
    time = Benchmark.realtime do
      bub = BubbleSort.new
      bub.bubble_sort(array)
    end
    puts "Bubble Sort Time: #{time} seconds"
  end

  def merge_sort_time(array)
    time = Benchmark.realtime do
      merge = MergeSort.new
      merge.merge_sort(array)
    end
    puts "Merge Sort Time: #{time} seconds"
  end

  def quick_sort_time(array)
    time = Benchmark.realtime do
      quick = QuickSort.new
      quick.quick_sort(array, 0, array.length-1)
    end
    puts "Quick Sort Time: #{time} seconds"
  end

  def heap_sort_time(array)
    time = Benchmark.realtime do
      heap = HeapSort.new
      heap.heap_sort(array)
    end
    puts "Heap Sort Time: #{time} seconds"
  end

  def bucket_sort_time(array)
    time = Benchmark.realtime do
      bucket = BucketSort.new
      bucket.bucket_sort(array)
    end
    puts "Bucket Sort Time: #{time} seconds"
  end
end

sortings = SortingAlgos.new
arr = sortings.create_array
# arr = ['E', 'C', 'A', 'B', 'F', 'G', 'D']

sortings.insertion_sort_time(arr)
sortings.selection_sort_time(arr)
sortings.bubble_sort_time(arr)
sortings.merge_sort_time(arr)
sortings.quick_sort_time(arr)
sortings.heap_sort_time(arr)
sortings.bucket_sort_time(arr)

# # Result when 'arr' is random words
# Insertion Sort Time: 9.74670983850956e-05 seconds
# Selection Sort Time: 0.00021768081933259964 seconds
# Bubble Sort Time: 5.0709815695881844e-05 seconds
# Merge Sort Time: 0.0001670608762651682 seconds
# Quick Sort Time: 0.0003114859573543072 seconds
# Heap Sort Time: 0.00019613001495599747 seconds
# Bucket Sort Time: 8.90891533344984e-05 seconds


# # Result when 'arr' is ['E', 'C', 'A', 'B', 'F', 'G', 'D']
# Insertion Sort Time: 1.316610723733902e-05 seconds
# Selection Sort Time: 9.82498750090599e-06 seconds
# Bubble Sort Time: 6.458023563027382e-06 seconds
# Merge Sort Time: 1.1239899322390556e-05 seconds
# Quick Sort Time: 1.4298828318715096e-05 seconds
# Heap Sort Time: 1.9755912944674492e-05 seconds
# Bucket Sort Time: 3.400794230401516e-05 seconds
