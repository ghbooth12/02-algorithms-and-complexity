class RecursiveFibonnaci
  def fib(n)
    return n if n == 0 || n == 1
    return fib(n-2) + fib(n-1)
  end
end

# recursive_fib = RecursiveFibonnaci.new
# puts recursive_fib.fib(10) # 55
# puts recursive_fib.fib(11) # 89
# puts recursive_fib.fib(12) # 144
