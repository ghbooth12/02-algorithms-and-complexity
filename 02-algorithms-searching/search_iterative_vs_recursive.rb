require 'benchmark'
require_relative 'linear_search'
require_relative 'binary_search_iterative'
require_relative 'binary_search_recursive'

linear = Linear.new
bi_iterative = Iterative.new
bi_recursive = Recursive.new

alphabets = ('A'..'Z').to_a


linear_time = Benchmark.realtime do
  1.times { linear.search(alphabets, 'G') }
end

bi_iterative_time = Benchmark.realtime do
  1.times { bi_iterative.search(alphabets, 'G') }
end

bi_recursive_time = Benchmark.realtime do
  1.times { bi_recursive.search(alphabets, 'G') }
end


puts "Linear Search time: #{linear_time} seconds"
puts "Binary Search Iterative time: #{bi_iterative_time} seconds"
puts "Binary Search Recursive time: #{bi_recursive_time} seconds"
