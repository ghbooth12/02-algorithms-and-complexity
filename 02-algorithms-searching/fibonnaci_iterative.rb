class IterativeFibonnaci
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
end
