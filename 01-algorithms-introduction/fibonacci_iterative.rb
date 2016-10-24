def fib(n)
  return n if n == 0 || n == 1

  x = 0
  y = 1
  for i in 0..n-2
    temp = x
    x = y
    y = temp + x
  end
  y
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
puts fib(10)
