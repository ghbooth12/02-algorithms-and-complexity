class BubbleSort
  def bubble_sort(array)
    l = array.length

    # begin/end until loop: loops until the conditional is true
    begin
      swapped = false

      # No need to run n.times because the second-to-last item is compared with the last item.
      (l-1).times do |i|
        if array[i] > array[i+1]  # if preceding item is greater, then swap.
          temp = array[i]
          array[i] = array[i+1]
          array[i+1] = temp
          swapped = true
        end
      end
    end until not swapped  # equals to !swapped (if swapped is false, loop ends.)
    array
  end
end
