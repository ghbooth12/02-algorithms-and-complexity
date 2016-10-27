require 'benchmark'
require_relative 'fibonnaci_iterative'
require_relative 'fibonnaci_recursive'

iterative_fib = IterativeFibonnaci.new
recursive_fib = RecursiveFibonnaci.new

iterative_time = Benchmark.realtime do
  1.times{ iterative_fib.fib(20) }
end

recursive_time = Benchmark.realtime do
  1.times{ recursive_fib.fib(20) }
end

puts "iterative fibonnaci: #{iterative_time} seconds"
puts "recursive fibonnaci: #{recursive_time} seconds"
puts "Iterative fibonnaci is #{recursive_time / iterative_time.to_f} times faster than recursive fibonnaci."
