class LinearSearchComplexity
  # This method returns how many times iteration runs in the worst case for the array with the given input_size
  def get_complexity(input_size)
    array = Array.new(input_size) do
      ('A'..'Z').to_a.sample(3).join 
    end

    # counts interations for the worst-case(last item)
    iteration_counter(array, array[-1])
  end

  # This method counts how many times the iteration runs
  def iteration_counter(array, target)
    counter = 0
    for el in array
      counter += 1
      if el == target
        return counter
      end
    end
    counter
  end
end
