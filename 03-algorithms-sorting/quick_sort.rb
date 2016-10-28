class QuickSort
  # p: index of first item of the array known to be <= pivot
  # q: index of first item of the array known to be > pivot
  # j: index of first item of the array not yet examined
  # r: index of last item(pivot)
  # Initially p,q,j are the same

  # This method recursively divides the array with the pivot.
  def quick_sort(array)
    if array.length <= 1
      return array
    end

    pivot = array[array.length - 1] # when 'combine', pivot will be array[q]
    sm = [] # same as array[p..q-1]
    lg = [] # same as array[q+1..r-q]

    for j in 0..array.length-2 # excludes pivot
      if array[j] <= pivot
        sm << array[j]
      else
        lg << array[j]
      end
    end

    # Recursion!
    left = quick_sort(sm)
    right = quick_sort(lg)
    combine(left, pivot, right)
  end

  # This method combines the divided sub-arrays and pivot.
  def combine(left, pivot, right)
    if [pivot] == left || [pivot] == right
      left + right
    else
      left + [pivot] + right
    end
  end
end
